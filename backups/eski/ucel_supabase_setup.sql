-- ============================================================
-- ÜÇEL Steel Construction — Supabase profil/trigger kurulum scripti
-- Supabase Dashboard > SQL Editor'da tamamını seçip Run dey.
-- ============================================================

-- 1) habib için profil satırını oluştur (rol değerini CHECK kısıtından otomatik seçer)
DO $$
DECLARE
  v_user_id        uuid;
  v_constraint_def text;
  v_role           text;
  v_candidates     text[] := ARRAY[
    'admin','administrator','superadmin','super_admin','owner',
    'sahip','yonetici','yönetici','patron','mudur','müdür','manager'
  ];
  c text;
BEGIN
  -- habib'in auth.users içindeki id'sini bul
  SELECT id INTO v_user_id
  FROM auth.users
  WHERE email ILIKE '%habib%'
     OR raw_user_meta_data->>'username' = 'habib'
  ORDER BY created_at DESC
  LIMIT 1;

  IF v_user_id IS NULL THEN
    RAISE EXCEPTION 'habib kullanıcısı auth.users içinde bulunamadı. Önce Authentication > Users içinden kullanıcıyı oluşturmalısın.';
  END IF;

  -- profiles_role_check tanımını al
  SELECT pg_get_constraintdef(oid) INTO v_constraint_def
  FROM pg_constraint
  WHERE conname = 'profiles_role_check'
  LIMIT 1;

  -- Aday roller arasından kısıta uyanı seç
  IF v_constraint_def IS NOT NULL THEN
    FOREACH c IN ARRAY v_candidates LOOP
      IF v_constraint_def ILIKE '%''' || c || '''%' THEN
        v_role := c;
        EXIT;
      END IF;
    END LOOP;

    -- Hiçbir aday uymadıysa kısıttaki ilk değeri al
    IF v_role IS NULL THEN
      v_role := substring(v_constraint_def from E'''([^'']+)''');
    END IF;
  ELSE
    v_role := 'admin';
  END IF;

  -- Profili oluştur / güncelle
  INSERT INTO public.profiles (id, username, full_name, role, initials)
  VALUES (v_user_id, 'habib', 'Habib İlgin', v_role, 'Hİ')
  ON CONFLICT (id) DO UPDATE
    SET username  = EXCLUDED.username,
        full_name = EXCLUDED.full_name,
        role      = EXCLUDED.role,
        initials  = EXCLUDED.initials;

  RAISE NOTICE 'OK -> habib profili hazır. Seçilen rol: %', v_role;
END $$;


-- 2) Yeni kullanıcılar için otomatik profil oluşturan fonksiyon + trigger
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_full_name      text := COALESCE(NULLIF(NEW.raw_user_meta_data->>'full_name',''), '');
  v_username       text := COALESCE(
                             NULLIF(NEW.raw_user_meta_data->>'username',''),
                             split_part(NEW.email, '@', 1)
                           );
  v_initials       text;
  v_constraint_def text;
  v_role           text;
  v_candidates     text[] := ARRAY[
    'worker','user','employee','calisan','çalışan','isci','işçi',
    'member','default','viewer','staff'
  ];
  c text;
BEGIN
  -- Initials üret ("Habib İlgin" -> "Hİ")
  IF position(' ' in v_full_name) > 0 THEN
    v_initials := upper(left(split_part(v_full_name,' ',1),1)
                     || left(split_part(v_full_name,' ',2),1));
  ELSIF length(v_full_name) > 0 THEN
    v_initials := upper(left(v_full_name,2));
  ELSE
    v_initials := upper(left(v_username,2));
  END IF;

  -- Varsayılan rolü kısıttan tespit et
  SELECT pg_get_constraintdef(oid) INTO v_constraint_def
  FROM pg_constraint
  WHERE conname = 'profiles_role_check'
  LIMIT 1;

  IF v_constraint_def IS NOT NULL THEN
    FOREACH c IN ARRAY v_candidates LOOP
      IF v_constraint_def ILIKE '%''' || c || '''%' THEN
        v_role := c;
        EXIT;
      END IF;
    END LOOP;
    IF v_role IS NULL THEN
      v_role := substring(v_constraint_def from E'''([^'']+)''');
    END IF;
  ELSE
    v_role := 'worker';
  END IF;

  INSERT INTO public.profiles (id, username, full_name, role, initials)
  VALUES (NEW.id, v_username, v_full_name, v_role, v_initials)
  ON CONFLICT (id) DO NOTHING;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


-- 3) Kontrol — şu sorgu habib satırını göstermeli
SELECT id, username, full_name, role, initials
FROM public.profiles
WHERE username = 'habib';
