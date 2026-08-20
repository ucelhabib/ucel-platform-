// ÜÇEL Steel Construction - Service Worker v34
// Strateji: HTML/JS için NETWORK-FIRST → her zaman taze sürüm, offline ise cache.
// Görseller için CACHE-FIRST (statik).

const CACHE_NAME = 'ucel-v202';
const STATIC_ASSETS = [
  './manifest.json',
  './icon-192.png',
  './icon-512.png',
  './apple-touch-icon.png',
  './favicon-32.png',
  './ucel-logo.png',
  './ucel-footer.png'
];

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => cache.addAll(STATIC_ASSETS)).catch(()=>{})
  );
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) =>
      Promise.all(keys.filter((k) => k !== CACHE_NAME).map((k) => caches.delete(k)))
    )
  );
  self.clients.claim();
});

self.addEventListener('message', (event) => {
  if (event.data === 'SKIP_WAITING') self.skipWaiting();
});

// PUSH: arka planda da bildirim gelsin
self.addEventListener('push', (event) => {
  let data = {};
  try { data = event.data ? event.data.json() : {}; } catch(e) { data = { title: 'ÜÇEL', body: event.data?.text() || 'Yeni bildirim' }; }
  const title = data.title || 'ÜÇEL Bildirim';
  const options = {
    body: data.body || '',
    icon: data.icon || './icon-192.png',
    badge: data.badge || './icon-192.png',
    tag: data.tag || 'ucel-' + Date.now(),
    data: data.data || {},
    vibrate: [200,100,200,100,400],
    requireInteraction: false
  };
  event.waitUntil(self.registration.showNotification(title, options));
});

// Bildirime tıklayınca uygulamayı aç (ya da odakla)
self.addEventListener('notificationclick', (event) => {
  event.notification.close();
  const url = (event.notification.data && event.notification.data.url) || 'https://ucelhabib.github.io/ucel-platform-/';
  event.waitUntil(
    self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then((clients) => {
      for (const c of clients) {
        if (c.url.includes('ucel-platform-') && 'focus' in c) return c.focus();
      }
      if (self.clients.openWindow) return self.clients.openWindow(url);
    })
  );
});

function isHtmlRequest(req) {
  if (req.mode === 'navigate') return true;
  const accept = req.headers.get('accept') || '';
  return accept.includes('text/html');
}

self.addEventListener('fetch', (event) => {
  const req = event.request;
  const url = new URL(req.url);

  // Supabase / CDN / API → her zaman ağdan
  if (
    url.hostname.includes('supabase.co') ||
    url.hostname.includes('supabase.in') ||
    url.hostname.includes('cdn.jsdelivr.net') ||
    url.hostname.includes('unpkg.com') ||
    req.method !== 'GET'
  ) {
    return; // varsayılan ağ davranışı
  }

  // index.html / navigasyon → NETWORK-FIRST (her zaman taze)
  if (isHtmlRequest(req) || url.pathname.endsWith('/index.html') || url.pathname.endsWith('/')) {
    event.respondWith(
      fetch(req, { cache: 'no-store' })
        .then((resp) => {
          if (resp && resp.status === 200) {
            const copy = resp.clone();
            caches.open(CACHE_NAME).then((c) => c.put(req, copy));
          }
          return resp;
        })
        .catch(() => caches.match(req).then((c) => c || caches.match('./index.html')))
    );
    return;
  }

  // İkonlar / manifest gibi statik dosyalar → CACHE-FIRST
  event.respondWith(
    caches.match(req).then((cached) => {
      if (cached) return cached;
      return fetch(req).then((resp) => {
        if (resp && resp.status === 200 && resp.type === 'basic') {
          const copy = resp.clone();
          caches.open(CACHE_NAME).then((c) => c.put(req, copy));
        }
        return resp;
      }).catch(() => cached);
    })
  );
});
