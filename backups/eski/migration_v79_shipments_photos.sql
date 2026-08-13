-- =====================================================================
-- ÜÇEL Steel Construction · v79 MIGRATION
-- shipments tablosuna çoklu görsel galeri için 'photos' kolonu eklenir.
-- Mevcut irsaliye_url ve kantar_url kolonları geriye uyumluluk için
-- silinmez — UI bunları photos array'ine merge eder.
-- =====================================================================
-- Supabase SQL Editor'de bu dosyayı bir kez çalıştır. Birden çok kez
-- çalışsa da hata vermez (IF NOT EXISTS / IF EXISTS koruması var).
-- =====================================================================

ALTER TABLE public.shipments
  ADD COLUMN IF NOT EXISTS photos JSONB DEFAULT '[]'::jsonb;

-- Boş kayıtları temizle (NULL gelirse UI'da hata olmasın)
UPDATE public.shipments
SET photos = '[]'::jsonb
WHERE photos IS NULL;

-- Mevcut irsaliye_url ve kantar_url'leri photos array'ine bir kerelik kopyala
-- (UI'da galeri tek seferde gözüksün, eski tek-slot kolonlar tutulur ama
--  yeni güncellemeler yalnızca photos array'inde toplanır)
UPDATE public.shipments
SET photos = (
  COALESCE(photos, '[]'::jsonb)
  || CASE WHEN irsaliye_url IS NOT NULL AND NOT (photos @> jsonb_build_array(jsonb_build_object('url', irsaliye_url)))
          THEN jsonb_build_array(jsonb_build_object('url', irsaliye_url, 'name', 'İrsaliye'))
          ELSE '[]'::jsonb END
  || CASE WHEN kantar_url IS NOT NULL AND NOT (photos @> jsonb_build_array(jsonb_build_object('url', kantar_url)))
          THEN jsonb_build_array(jsonb_build_object('url', kantar_url, 'name', 'Kantar Fişi'))
          ELSE '[]'::jsonb END
)
WHERE (irsaliye_url IS NOT NULL OR kantar_url IS NOT NULL);

-- =====================================================================
-- BAŞARILI ÇIKTI
-- =====================================================================
SELECT 'Migration tamamlandı. ' || COUNT(*) || ' yükleme kaydı var.' AS sonuc
FROM public.shipments;
