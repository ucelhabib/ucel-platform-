# ÜÇEL Steel Construction — Yönetim Platformu

Yapısal çelik proje yönetim sistemi (PWA). Teklif → Satın Alma → Üretim → Sevkiyat → Montaj → Muhasebe akışını tek uygulamada yönetir.

## ⚠️ ÖNEMLİ KURALLAR

- **Bu klasöre başka Cowork chat bağlanmaz.** Servis, teklif stüdyosu vb. modüller AYRI klasörlerde geliştirilir.
- **Canlıya çıkış sadece `fix.bat` ile** (çift tıkla → commit + push → GitHub Pages otomatik yayınlar).
- **Sadece yönetici proje silebilir.**

## Teknik Özet

| | |
|---|---|
| Uygulama | Tek dosya: `index.html` (vanilla JS, PWA) |
| Backend | Supabase (PostgreSQL + Auth + Realtime + Storage) |
| Yayın | GitHub Pages — https://ucelhabib.github.io/ucel-platform-/ |
| Cache | `service-worker.js` — her sürümde CACHE_NAME güncellenir |

## Sürüm Çıkışı

1. `index.html` içinde `APP_VERSION` güncelle
2. `service-worker.js` içinde `CACHE_NAME` güncelle (aynı sürüm no)
3. `fix.bat` çift tıkla
4. Önemli sürümlerde `KORUMA-TAG.bat` ile stable tag at

## Acil Geri Dönüş

```
git reset --hard vXXX-stable   (son stabil tag)
git push --force origin main
```

Stable tag listesi: `git tag -l "v2*-stable"`
