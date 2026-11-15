/* ==========================================================================
   RickandCommit · Visualizzatore PDF
   Basato su PDF.js (Mozilla). Rendering lazy delle pagine, text layer
   selezionabile, link interni/esterni, miniature, zoom e scorciatoie.
   Uso: viewer.html?file=<percorso/relativo.pdf>&title=<titolo opzionale>
   ========================================================================== */

const PDFJS_VERSION = '4.10.38';
const PDFJS_BASE = `https://cdn.jsdelivr.net/npm/pdfjs-dist@${PDFJS_VERSION}/build`;
const PDF_TO_CSS = 96 / 72;
const ZOOM_MIN = 0.4;
const ZOOM_MAX = 4;
const ZOOM_STEP = 1.15;
const AUTO_ZOOM_MAX = 1.35; // limite dello zoom automatico su schermi molto larghi
const THUMB_WIDTH = 168;

const $ = (id) => document.getElementById(id);

const ui = {
  title: $('docTitle'),
  meta: $('docMeta'),
  stage: $('stage'),
  pages: $('pages'),
  sidebar: $('sidebar'),
  thumbs: $('thumbs'),
  progress: $('readProgress'),
  pageInput: $('pageInput'),
  pageTotal: $('pageTotal'),
  btnPrev: $('btnPrev'),
  btnNext: $('btnNext'),
  btnZoomIn: $('btnZoomIn'),
  btnZoomOut: $('btnZoomOut'),
  btnZoomFit: $('btnZoomFit'),
  btnSidebar: $('btnSidebar'),
  btnCloseSidebar: $('btnCloseSidebar'),
  btnDownload: $('btnDownload'),
  loading: $('stateLoading'),
  loadingPercent: $('loadingPercent'),
  error: $('stateError'),
  errorMessage: $('errorMessage'),
  errorRawLink: $('errorRawLink'),
};

const state = {
  pdfjs: null,
  pdf: null,
  file: '',
  zoom: 1,
  autoZoom: true,
  current: 1,
  baseSizes: [],   // dimensioni a scala 1 (CSS px) di ogni pagina
  views: [],       // { wrap, rendered, task, generation }
  thumbsBuilt: false,
  generation: 0,
  pageObserver: null,
  thumbObserver: null,
};

/* --------------------------------------------------------------------------
   Parametri e validazione (solo PDF relativi allo stesso sito)
   -------------------------------------------------------------------------- */

function readParams() {
  const params = new URLSearchParams(window.location.search);
  const file = (params.get('file') || '').trim();
  const title = (params.get('title') || '').trim();
  return { file, title };
}

function isSafeRelativePdf(path) {
  return /^[A-Za-z0-9][A-Za-z0-9_\-./]*\.pdf$/i.test(path)
    && !path.includes('..')
    && !path.includes('//');
}

function titleFromFilename(path) {
  const name = path.split('/').pop().replace(/\.pdf$/i, '');
  const dateMatch = name.match(/^(\d{4}-\d{2}-\d{2})_(.+)$/);
  let core = dateMatch ? dateMatch[2] : name;
  core = core.replace(/_v\d+\.\d+\.\d+$/i, '').replace(/_firmato$/i, ' (Firmato)');
  core = core.replace(/_/g, ' ');
  return dateMatch ? `${core} ${dateMatch[1]}` : core;
}

/* --------------------------------------------------------------------------
   Stati UI
   -------------------------------------------------------------------------- */

function showError(message, rawLink) {
  ui.loading.hidden = true;
  ui.error.hidden = false;
  ui.errorMessage.textContent = message;
  if (rawLink) {
    ui.errorRawLink.href = rawLink;
    ui.errorRawLink.hidden = false;
  }
  ui.title.textContent = 'Documento non disponibile';
  if (ui.meta) ui.meta.textContent = 'ERRORE';
  setControlsEnabled(false);
}

function setControlsEnabled(enabled) {
  [ui.btnPrev, ui.btnNext, ui.btnZoomIn, ui.btnZoomOut, ui.btnZoomFit, ui.btnSidebar, ui.pageInput]
    .forEach((el) => { el.disabled = !enabled; });
  ui.btnDownload.style.visibility = enabled ? 'visible' : 'hidden';
}

/* --------------------------------------------------------------------------
   Zoom
   -------------------------------------------------------------------------- */

function computeAutoZoom() {
  const first = state.baseSizes[0];
  if (!first) return 1;
  const available = ui.stage.clientWidth - (window.innerWidth <= 640 ? 24 : 64);
  return Math.max(ZOOM_MIN, Math.min(AUTO_ZOOM_MAX, available / first.width));
}

function updateZoomLabel() {
  ui.btnZoomFit.textContent = `${Math.round(state.zoom * 100)}%`;
  ui.btnZoomOut.disabled = state.zoom <= ZOOM_MIN + 1e-3;
  ui.btnZoomIn.disabled = state.zoom >= ZOOM_MAX - 1e-3;
}

function setZoom(newZoom, { auto = false } = {}) {
  const clamped = Math.max(ZOOM_MIN, Math.min(ZOOM_MAX, newZoom));
  state.autoZoom = auto;
  if (Math.abs(clamped - state.zoom) < 1e-3 && state.views.length) {
    updateZoomLabel();
    return;
  }

  // Mantiene la posizione relativa all'interno della pagina corrente
  const anchor = state.views[state.current - 1]?.wrap;
  const offsetRatio = anchor
    ? (ui.stage.scrollTop - anchor.offsetTop) / Math.max(1, anchor.offsetHeight)
    : 0;

  state.zoom = clamped;
  layoutPages();
  updateZoomLabel();

  const target = state.views[state.current - 1]?.wrap;
  if (target) {
    ui.stage.scrollTop = target.offsetTop + offsetRatio * target.offsetHeight;
  }
}

/* --------------------------------------------------------------------------
   Pagine: impaginazione e rendering lazy
   -------------------------------------------------------------------------- */

function buildPageShells() {
  ui.pages.innerHTML = '';
  state.views = state.baseSizes.map((_, i) => {
    const wrap = document.createElement('div');
    wrap.className = 'vpage-wrap';
    wrap.dataset.page = String(i + 1);
    wrap.setAttribute('role', 'img');
    wrap.setAttribute('aria-label', `Pagina ${i + 1} di ${state.baseSizes.length}`);

    const label = document.createElement('span');
    label.className = 'vpage-label';
    label.textContent = `${i + 1} / ${state.baseSizes.length}`;
    wrap.appendChild(label);

    ui.pages.appendChild(wrap);
    return { wrap, rendered: false, task: null, generation: -1 };
  });
}

function layoutPages() {
  state.generation += 1;
  const scale = state.zoom * PDF_TO_CSS;

  state.views.forEach((view, i) => {
    const { width, height } = state.baseSizes[i];
    if (view.task) {
      try { view.task.cancel(); } catch (_) { /* rendering già concluso */ }
      view.task = null;
    }
    view.rendered = false;
    view.wrap.style.width = `${Math.floor(width * scale / PDF_TO_CSS)}px`;
    view.wrap.style.height = `${Math.floor(height * scale / PDF_TO_CSS)}px`;
    // Rimuove i layer precedenti mantenendo l'etichetta della pagina
    view.wrap.querySelectorAll('canvas, .textLayer, .vlink-layer').forEach((n) => n.remove());
  });

  observePages();
}

function observePages() {
  if (state.pageObserver) state.pageObserver.disconnect();
  state.pageObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (!entry.isIntersecting) return;
      const index = Number(entry.target.dataset.page) - 1;
      renderPage(index);
    });
  }, { root: ui.stage, rootMargin: '800px 0px' });

  state.views.forEach((v) => state.pageObserver.observe(v.wrap));
}

async function renderPage(index) {
  const view = state.views[index];
  if (!view || view.rendered) return;
  view.rendered = true;
  const generation = state.generation;

  try {
    const page = await state.pdf.getPage(index + 1);
    if (generation !== state.generation) return;

    const viewport = page.getViewport({ scale: state.zoom * PDF_TO_CSS });
    const dpr = Math.min(window.devicePixelRatio || 1, 3);

    const canvas = document.createElement('canvas');
    canvas.width = Math.floor(viewport.width * dpr);
    canvas.height = Math.floor(viewport.height * dpr);
    canvas.style.width = `${Math.floor(viewport.width)}px`;
    canvas.style.height = `${Math.floor(viewport.height)}px`;

    const ctx = canvas.getContext('2d', { alpha: false });
    view.task = page.render({
      canvasContext: ctx,
      viewport,
      transform: dpr !== 1 ? [dpr, 0, 0, dpr, 0, 0] : null,
    });
    view.wrap.prepend(canvas);
    await view.task.promise;
    view.task = null;
    if (generation !== state.generation) return;

    // Variabili richieste dal CSS del text layer di PDF.js
    view.wrap.style.setProperty('--scale-factor', String(viewport.scale));
    view.wrap.style.setProperty('--user-unit', '1');
    view.wrap.style.setProperty('--total-scale-factor', String(viewport.scale));

    await Promise.all([
      renderTextLayer(page, viewport, view.wrap, generation),
      renderLinkLayer(page, viewport, view.wrap, generation),
    ]);
  } catch (err) {
    if (err && err.name === 'RenderingCancelledException') return;
    view.rendered = false;
    console.warn(`[viewer] Errore rendering pagina ${index + 1}:`, err);
  }
}

async function renderTextLayer(page, viewport, wrap, generation) {
  if (!state.pdfjs.TextLayer) return;
  const container = document.createElement('div');
  container.className = 'textLayer';
  wrap.appendChild(container);
  const layer = new state.pdfjs.TextLayer({
    textContentSource: page.streamTextContent(),
    container,
    viewport,
  });
  await layer.render();
  if (generation !== state.generation) container.remove();
}

async function renderLinkLayer(page, viewport, wrap, generation) {
  const annotations = await page.getAnnotations({ intent: 'display' });
  if (generation !== state.generation) return;
  const links = annotations.filter((a) => a.subtype === 'Link' && (a.url || a.dest));
  if (!links.length) return;

  const layer = document.createElement('div');
  layer.className = 'vlink-layer';

  links.forEach((a) => {
    const [x1, y1, x2, y2] = viewport.convertToViewportRectangle(a.rect);
    const el = document.createElement('a');
    el.style.left = `${Math.min(x1, x2)}px`;
    el.style.top = `${Math.min(y1, y2)}px`;
    el.style.width = `${Math.abs(x2 - x1)}px`;
    el.style.height = `${Math.abs(y2 - y1)}px`;

    if (a.url) {
      el.href = a.url;
      el.target = '_blank';
      el.rel = 'noopener noreferrer';
      el.title = a.url;
    } else {
      el.href = '#';
      el.title = 'Vai alla sezione';
      el.addEventListener('click', (e) => {
        e.preventDefault();
        goToDestination(a.dest);
      });
    }
    layer.appendChild(el);
  });

  wrap.appendChild(layer);
}

async function goToDestination(dest) {
  try {
    const explicit = typeof dest === 'string' ? await state.pdf.getDestination(dest) : dest;
    if (!Array.isArray(explicit)) return;
    const ref = explicit[0];
    const pageIndex = typeof ref === 'object' ? await state.pdf.getPageIndex(ref) : Number(ref);
    goToPage(pageIndex + 1);
  } catch (err) {
    console.warn('[viewer] Destinazione non risolta:', err);
  }
}

/* --------------------------------------------------------------------------
   Navigazione e pagina corrente
   -------------------------------------------------------------------------- */

function goToPage(n, { smooth = true } = {}) {
  const page = Math.max(1, Math.min(state.baseSizes.length, n));
  const target = state.views[page - 1]?.wrap;
  if (!target) return;
  ui.stage.scrollTo({ top: target.offsetTop - 16, behavior: smooth ? 'smooth' : 'auto' });
  setCurrentPage(page);
}

function setCurrentPage(n) {
  if (n === state.current && ui.pageInput.value === String(n)) return;
  state.current = n;
  if (document.activeElement !== ui.pageInput) ui.pageInput.value = String(n);
  ui.btnPrev.disabled = n <= 1;
  ui.btnNext.disabled = n >= state.baseSizes.length;

  ui.thumbs.querySelectorAll('.vthumb').forEach((t) => {
    const active = Number(t.dataset.page) === n;
    t.classList.toggle('active', active);
    if (active) t.setAttribute('aria-current', 'page'); else t.removeAttribute('aria-current');
  });
  const activeThumb = ui.thumbs.querySelector('.vthumb.active');
  if (activeThumb && !ui.sidebar.hidden) activeThumb.scrollIntoView({ block: 'nearest' });

  history.replaceState(null, '', `${window.location.search}#page=${n}`);
}

function onStageScroll() {
  const { scrollTop, scrollHeight, clientHeight } = ui.stage;
  const max = scrollHeight - clientHeight;
  ui.progress.style.width = `${max > 0 ? Math.min(100, (scrollTop / max) * 100) : 100}%`;

  // Pagina corrente: quella che occupa la linea a un terzo della viewport
  const probe = scrollTop + clientHeight / 3;
  let current = 1;
  for (let i = 0; i < state.views.length; i += 1) {
    if (state.views[i].wrap.offsetTop <= probe) current = i + 1;
    else break;
  }
  setCurrentPage(current);
}

/* --------------------------------------------------------------------------
   Miniature
   -------------------------------------------------------------------------- */

function buildThumbnails() {
  if (state.thumbsBuilt) return;
  state.thumbsBuilt = true;

  state.thumbObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (!entry.isIntersecting) return;
      state.thumbObserver.unobserve(entry.target);
      renderThumbnail(entry.target);
    });
  }, { root: ui.sidebar, rootMargin: '400px 0px' });

  state.baseSizes.forEach((size, i) => {
    const btn = document.createElement('button');
    btn.type = 'button';
    btn.className = 'vthumb';
    btn.dataset.page = String(i + 1);
    btn.setAttribute('aria-label', `Vai alla pagina ${i + 1}`);

    const frame = document.createElement('div');
    frame.className = 'vthumb-frame';
    frame.style.aspectRatio = `${size.width} / ${size.height}`;

    const num = document.createElement('span');
    num.textContent = String(i + 1);

    btn.append(frame, num);
    btn.addEventListener('click', () => goToPage(i + 1));
    ui.thumbs.appendChild(btn);
    state.thumbObserver.observe(btn);
  });

  setCurrentPage(state.current);
}

async function renderThumbnail(btn) {
  try {
    const page = await state.pdf.getPage(Number(btn.dataset.page));
    const base = page.getViewport({ scale: 1 });
    const dpr = Math.min(window.devicePixelRatio || 1, 2);
    const viewport = page.getViewport({ scale: (THUMB_WIDTH / base.width) * dpr });
    const canvas = document.createElement('canvas');
    canvas.width = Math.floor(viewport.width);
    canvas.height = Math.floor(viewport.height);
    await page.render({ canvasContext: canvas.getContext('2d', { alpha: false }), viewport }).promise;
    btn.querySelector('.vthumb-frame').appendChild(canvas);
  } catch (err) {
    console.warn('[viewer] Errore miniatura:', err);
  }
}

function toggleSidebar(force) {
  const isCollapsed = ui.sidebar.classList.contains('collapsed');
  const open = typeof force === 'boolean' ? force : isCollapsed;
  ui.sidebar.classList.toggle('collapsed', !open);
  ui.btnSidebar.setAttribute('aria-pressed', String(open));
  ui.btnSidebar.setAttribute('title', open ? 'Chiudi miniature (T)' : 'Miniature (T)');
  try { localStorage.setItem('rc-viewer-sidebar', open ? '1' : '0'); } catch (_) { /* storage non disponibile */ }
  if (open) buildThumbnails();
  setTimeout(() => {
    if (state.autoZoom) setZoom(computeAutoZoom(), { auto: true });
  }, 290);
}

/* --------------------------------------------------------------------------
   Eventi
   -------------------------------------------------------------------------- */

function bindEvents() {
  ui.btnPrev.addEventListener('click', () => goToPage(state.current - 1));
  ui.btnNext.addEventListener('click', () => goToPage(state.current + 1));
  ui.btnZoomIn.addEventListener('click', () => setZoom(state.zoom * ZOOM_STEP));
  ui.btnZoomOut.addEventListener('click', () => setZoom(state.zoom / ZOOM_STEP));
  ui.btnZoomFit.addEventListener('click', () => setZoom(computeAutoZoom(), { auto: true }));
  ui.btnSidebar.addEventListener('click', () => toggleSidebar());
  if (ui.btnCloseSidebar) {
    ui.btnCloseSidebar.addEventListener('click', () => toggleSidebar(false));
  }

  ui.pageInput.addEventListener('focus', () => ui.pageInput.select());
  ui.pageInput.addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
      const n = parseInt(ui.pageInput.value, 10);
      if (!Number.isNaN(n)) goToPage(n);
      ui.pageInput.blur();
    } else if (e.key === 'Escape') {
      ui.pageInput.value = String(state.current);
      ui.pageInput.blur();
    }
  });
  ui.pageInput.addEventListener('blur', () => { ui.pageInput.value = String(state.current); });

  let scrollRaf = 0;
  ui.stage.addEventListener('scroll', () => {
    if (scrollRaf) return;
    scrollRaf = requestAnimationFrame(() => { scrollRaf = 0; onStageScroll(); });
  }, { passive: true });

  // Ctrl/⌘ + rotella: zoom sul documento invece che sulla pagina
  ui.stage.addEventListener('wheel', (e) => {
    if (!e.ctrlKey && !e.metaKey) return;
    e.preventDefault();
    setZoom(e.deltaY < 0 ? state.zoom * 1.08 : state.zoom / 1.08);
  }, { passive: false });

  document.addEventListener('keydown', (e) => {
    if (e.target instanceof HTMLInputElement) return;
    const ctrl = e.ctrlKey || e.metaKey;
    if (ctrl && (e.key === '+' || e.key === '=')) { e.preventDefault(); setZoom(state.zoom * ZOOM_STEP); return; }
    if (ctrl && e.key === '-') { e.preventDefault(); setZoom(state.zoom / ZOOM_STEP); return; }
    if (ctrl && e.key === '0') { e.preventDefault(); setZoom(computeAutoZoom(), { auto: true }); return; }
    if (ctrl || e.altKey) return;

    switch (e.key) {
      case 'ArrowRight': case 'PageDown': case 'n': e.preventDefault(); goToPage(state.current + 1); break;
      case 'ArrowLeft': case 'PageUp': case 'p': e.preventDefault(); goToPage(state.current - 1); break;
      case 'Home': e.preventDefault(); goToPage(1); break;
      case 'End': e.preventDefault(); goToPage(state.baseSizes.length); break;
      case '+': case '=': setZoom(state.zoom * ZOOM_STEP); break;
      case '-': setZoom(state.zoom / ZOOM_STEP); break;
      case '0': setZoom(computeAutoZoom(), { auto: true }); break;
      case 'Escape':
        if (!ui.sidebar.classList.contains('collapsed')) { e.preventDefault(); toggleSidebar(false); }
        break;
      case 't': case 'T': toggleSidebar(); break;
      default: break;
    }
  });

  let resizeTimer = 0;
  window.addEventListener('resize', () => {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(() => {
      if (state.autoZoom) setZoom(computeAutoZoom(), { auto: true });
    }, 150);
  });
}

/* --------------------------------------------------------------------------
   Avvio
   -------------------------------------------------------------------------- */

async function extractVersion(pdf) {
  const fromName = state.file.match(/_v(\d+\.\d+\.\d+)\.pdf$/i);
  if (fromName) return `v${fromName[1]}`;
  try {
    const page = await pdf.getPage(1);
    const content = await page.getTextContent();
    const text = content.items.map((it) => it.str).join(' ');
    const m = text.match(/Versione\s*:?\s*v?(\d+\.\d+\.\d+)/i);
    return m ? `v${m[1]}` : '';
  } catch (_) {
    return '';
  }
}

async function init() {
  const { file, title } = readParams();
  setControlsEnabled(false);

  if (!file) {
    showError('Nessun documento specificato. Apri un documento dalla pagina principale del sito.');
    return;
  }
  if (!isSafeRelativePdf(file)) {
    showError('Percorso del documento non valido.');
    return;
  }

  state.file = file;
  const filename = file.split('/').pop();
  ui.btnDownload.href = file;
  ui.btnDownload.setAttribute('download', filename);

  try {
    state.pdfjs = await import(`${PDFJS_BASE}/pdf.min.mjs`);
    state.pdfjs.GlobalWorkerOptions.workerSrc = `${PDFJS_BASE}/pdf.worker.min.mjs`;
  } catch (err) {
    console.error(err);
    showError('Impossibile caricare il motore di visualizzazione. Puoi comunque aprire il PDF originale.', file);
    return;
  }

  try {
    const task = state.pdfjs.getDocument({ url: file });
    task.onProgress = ({ loaded, total }) => {
      if (total) ui.loadingPercent.textContent = `Caricamento del documento · ${Math.round((loaded / total) * 100)}%`;
    };
    state.pdf = await task.promise;
  } catch (err) {
    console.error(err);
    showError(`Il documento “${filename}” non è stato trovato o è danneggiato.`, file);
    return;
  }

  // Titolo: parametro > metadati PDF > nome file
  let docTitle = title;
  if (!docTitle) {
    try {
      const { info } = await state.pdf.getMetadata();
      docTitle = (info && info.Title) ? info.Title : '';
    } catch (_) { docTitle = ''; }
  }
  docTitle = docTitle || titleFromFilename(file);
  ui.title.textContent = docTitle;
  ui.title.title = docTitle;
  document.title = `${docTitle} · RickandCommit`;

  // Dimensioni di tutte le pagine (necessarie per impaginare prima del rendering)
  const sizes = [];
  for (let i = 1; i <= state.pdf.numPages; i += 1) {
    const page = await state.pdf.getPage(i);
    const vp = page.getViewport({ scale: PDF_TO_CSS });
    sizes.push({ width: vp.width, height: vp.height });
  }
  state.baseSizes = sizes;

  if (ui.meta) {
    const version = await extractVersion(state.pdf);
    const pagesLabel = `${state.pdf.numPages} ${state.pdf.numPages === 1 ? 'pagina' : 'pagine'}`;
    ui.meta.textContent = [version, pagesLabel, 'PDF'].filter(Boolean).join(' · ');
  }
  ui.pageTotal.textContent = `/ ${state.pdf.numPages}`;

  ui.loading.hidden = true;
  setControlsEnabled(true);
  buildPageShells();
  bindEvents();

  let sidebarPref = '0';
  try { sidebarPref = localStorage.getItem('rc-viewer-sidebar') || '0'; } catch (_) { /* ignorato */ }
  if (sidebarPref === '1' && window.innerWidth > 900 && state.pdf.numPages > 1) {
    toggleSidebar(true);
  } else {
    toggleSidebar(false);
  }

  state.zoom = 0; // forza il primo layout
  setZoom(computeAutoZoom(), { auto: true });

  const hashPage = parseInt((window.location.hash.match(/page=(\d+)/) || [])[1], 10);
  state.current = 0;
  if (!Number.isNaN(hashPage) && hashPage > 1) goToPage(hashPage, { smooth: false });
  else setCurrentPage(1);
  onStageScroll();
  ui.stage.focus({ preventScroll: true });
}

init();
