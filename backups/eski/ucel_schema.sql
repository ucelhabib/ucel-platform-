-- ============================================================
-- ÜÇEL Steel Construction — TAM ŞEMA + RLS KURULUM SCRIPTI
-- Tarih: 2026-06-17 (v66)
--
-- Bu dosya bir Supabase projesine sıfırdan kurulum yapmak için
-- gerekli TÜM tabloları, indeksleri ve RLS politikalarını içerir.
--
-- Kullanım:
--   1. Supabase Dashboard > SQL Editor'ı aç
--   2. Bu dosyanın tamamını seç ve Run de
--   3. ucel_supabase_setup.sql ile profilleri ekle
-- ============================================================

-- ============ TABLOLAR ============

CREATE TABLE IF NOT EXISTS public.profiles (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username text UNIQUE NOT NULL,
  full_name text NOT NULL,
  role text NOT NULL CHECK (role IN ('yonetici','teklifproje','satinalma','stok','uretim','sevk','montaj','muhasebe')),
  label text,
  initials text,
  color text DEFAULT '#1f4e8c',
  perms jsonb DEFAULT '[]'::jsonb,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.projects (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  no text NOT NULL,
  customer text NOT NULL,
  title text,
  location text,
  amount numeric DEFAULT 0,
  tonnage numeric DEFAULT 0,
  shipdate date,
  stage text,
  stages text[] DEFAULT ARRAY[]::text[],
  progress integer DEFAULT 0,
  phases jsonb DEFAULT '{}'::jsonb,
  phases_pending jsonb DEFAULT '{}'::jsonb,
  phase_dates jsonb DEFAULT '{}'::jsonb,
  owner_id uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  notes text,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.tasks (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  dept text NOT NULL,
  project_id uuid REFERENCES public.projects(id) ON DELETE CASCADE,
  assignee_id uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  due date,
  priority text DEFAULT 'medium',
  description text,
  done boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  created_by uuid REFERENCES public.profiles(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS public.stock_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  kategori text NOT NULL,
  urun text NOT NULL,
  boy1 integer DEFAULT 0, adet1 integer DEFAULT 0,
  boy2 integer DEFAULT 0, adet2 integer DEFAULT 0,
  boy3 integer DEFAULT 0, adet3 integer DEFAULT 0,
  birim text DEFAULT 'm',
  kg_per_meter numeric DEFAULT 0,
  not_text text,
  updated_by uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  updated_at timestamptz DEFAULT now(),
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.stock_files (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  path text NOT NULL,
  size integer,
  mime text,
  uploaded_by uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.stock_movements (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  item_id uuid REFERENCES public.stock_items(id) ON DELETE CASCADE,
  action text,
  slot integer,
  qty_change integer,
  length_mm integer,
  before_adet integer,
  after_adet integer,
  note text,
  project_id uuid REFERENCES public.projects(id) ON DELETE SET NULL,
  user_id uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.procurement_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id uuid REFERENCES public.projects(id) ON DELETE CASCADE,
  sira integer DEFAULT 0,
  malzeme text NOT NULL,
  ebat text,
  miktar numeric DEFAULT 0,
  birim text DEFAULT 'm',
  birim_fiyat numeric DEFAULT 0,
  kdv_orani integer DEFAULT 20,
  tevkifat_orani integer DEFAULT 0,
  fiyat_birimi text DEFAULT 'birim',
  catalog_id uuid REFERENCES public.stock_items(id) ON DELETE SET NULL,
  kg_per_meter numeric DEFAULT 0,
  stok_dusum numeric DEFAULT 0,
  original_ihtiyac numeric DEFAULT 0,
  not_text text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  created_by uuid REFERENCES public.profiles(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS public.procurement_deliveries (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  item_id uuid REFERENCES public.procurement_items(id) ON DELETE CASCADE,
  tarih date NOT NULL,
  miktar numeric NOT NULL,
  gercek_kg numeric,
  irsaliye_no text,
  fatura_no text,
  tedarikci text,
  fatura_tutari numeric,
  not_text text,
  created_by uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.site_reports (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id uuid REFERENCES public.projects(id) ON DELETE CASCADE,
  photo_url text NOT NULL,
  caption text,
  created_by uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.notifications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  text text NOT NULL,
  icon text DEFAULT '🔔',
  dept text DEFAULT 'system',
  ref_type text,
  ref_id uuid,
  actor_id uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  read_by uuid[] DEFAULT ARRAY[]::uuid[],
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.messages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  sender_id uuid REFERENCES public.profiles(id) ON DELETE CASCADE,
  text text,
  attachment_url text,
  attachment_name text,
  attachment_type text,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.attachments (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id uuid REFERENCES public.projects(id) ON DELETE CASCADE,
  name text NOT NULL,
  path text NOT NULL,
  size integer,
  mime text,
  uploaded_by uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.push_subscriptions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.profiles(id) ON DELETE CASCADE,
  endpoint text UNIQUE NOT NULL,
  p256dh text NOT NULL,
  auth text NOT NULL,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.app_settings (
  key text PRIMARY KEY,
  value jsonb,
  updated_by uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.audit_log (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.profiles(id) ON DELETE SET NULL,
  user_name text,
  action text NOT NULL,
  entity_type text,
  entity_id uuid,
  entity_label text,
  details jsonb,
  created_at timestamptz DEFAULT now()
);

-- ============ INDEKSLER ============
CREATE INDEX IF NOT EXISTS idx_tasks_project ON public.tasks(project_id);
CREATE INDEX IF NOT EXISTS idx_tasks_assignee ON public.tasks(assignee_id);
CREATE INDEX IF NOT EXISTS idx_proc_items_project ON public.procurement_items(project_id);
CREATE INDEX IF NOT EXISTS idx_proc_delv_item ON public.procurement_deliveries(item_id);
CREATE INDEX IF NOT EXISTS idx_notifs_created ON public.notifications(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_messages_created ON public.messages(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_audit_log_created ON public.audit_log(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_audit_log_user ON public.audit_log(user_id);

-- ============ RLS — ROW LEVEL SECURITY ============
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tasks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.stock_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.stock_files ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.stock_movements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.procurement_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.procurement_deliveries ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.site_reports ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.attachments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.push_subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.app_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.audit_log ENABLE ROW LEVEL SECURITY;

-- Helper: yönetici mi?
CREATE OR REPLACE FUNCTION public.is_admin() RETURNS boolean LANGUAGE sql STABLE AS $$
  SELECT EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'yonetici');
$$;

-- Profiles
CREATE POLICY "profiles_select" ON public.profiles FOR SELECT USING (true);
CREATE POLICY "profiles_update_self_or_admin" ON public.profiles FOR UPDATE USING (id = auth.uid() OR public.is_admin());
CREATE POLICY "profiles_insert_admin" ON public.profiles FOR INSERT WITH CHECK (public.is_admin());

-- Projects
CREATE POLICY "projects_select" ON public.projects FOR SELECT USING (true);
CREATE POLICY "projects_insert" ON public.projects FOR INSERT WITH CHECK (
  EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = ANY (ARRAY['yonetici','teklifproje']))
);
CREATE POLICY "projects_update" ON public.projects FOR UPDATE USING (
  EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = ANY (ARRAY['yonetici','teklifproje']))
);
CREATE POLICY "projects_delete" ON public.projects FOR DELETE USING (public.is_admin());

-- Tasks — sadece yönetici INSERT/DELETE; UPDATE yönetici veya görevin atandığı kişi
CREATE POLICY "tasks_select" ON public.tasks FOR SELECT USING (true);
CREATE POLICY "tasks_insert" ON public.tasks FOR INSERT WITH CHECK (public.is_admin());
CREATE POLICY "tasks_update" ON public.tasks FOR UPDATE USING (public.is_admin() OR assignee_id = auth.uid());
CREATE POLICY "tasks_delete" ON public.tasks FOR DELETE USING (public.is_admin());

-- Stock items: yönetici + teklifproje + satinalma + uretim
CREATE POLICY "stock_items_select" ON public.stock_items FOR SELECT USING (true);
CREATE POLICY "stock_items_insert_auth" ON public.stock_items FOR INSERT WITH CHECK (
  EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = ANY (ARRAY['yonetici','teklifproje','satinalma','uretim']))
);
CREATE POLICY "stock_items_update_auth" ON public.stock_items FOR UPDATE USING (
  EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = ANY (ARRAY['yonetici','teklifproje','satinalma','uretim']))
);
CREATE POLICY "stock_items_delete_admin" ON public.stock_items FOR DELETE USING (public.is_admin());

-- Stock files / movements
CREATE POLICY "stock_files_select" ON public.stock_files FOR SELECT USING (true);
CREATE POLICY "stock_files_insert_auth" ON public.stock_files FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "stock_files_delete_owner_or_admin" ON public.stock_files FOR DELETE USING (uploaded_by = auth.uid() OR public.is_admin());
CREATE POLICY "stock_movements_select" ON public.stock_movements FOR SELECT USING (true);
CREATE POLICY "stock_movements_insert_auth" ON public.stock_movements FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);

-- Procurement items
CREATE POLICY "pi_select" ON public.procurement_items FOR SELECT USING (true);
CREATE POLICY "pi_insert" ON public.procurement_items FOR INSERT WITH CHECK (
  EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = ANY (ARRAY['yonetici','teklifproje','satinalma']))
);
CREATE POLICY "pi_update" ON public.procurement_items FOR UPDATE USING (
  EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = ANY (ARRAY['yonetici','teklifproje','satinalma','muhasebe']))
);
CREATE POLICY "pi_delete" ON public.procurement_items FOR DELETE USING (
  EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = ANY (ARRAY['yonetici','teklifproje']))
);

-- Procurement deliveries — yönetici + satinalma + uretim (Süleyman atölyede teslim alır)
CREATE POLICY "pd_select" ON public.procurement_deliveries FOR SELECT USING (true);
CREATE POLICY "pd_insert" ON public.procurement_deliveries FOR INSERT WITH CHECK (
  EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = ANY (ARRAY['yonetici','satinalma','uretim']))
);
CREATE POLICY "pd_update" ON public.procurement_deliveries FOR UPDATE USING (
  EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = ANY (ARRAY['yonetici','satinalma','uretim']))
);
CREATE POLICY "pd_delete" ON public.procurement_deliveries FOR DELETE USING (
  EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = ANY (ARRAY['yonetici','satinalma','uretim']))
);

-- Site reports
CREATE POLICY "sr_select" ON public.site_reports FOR SELECT USING (true);
CREATE POLICY "sr_insert" ON public.site_reports FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "sr_delete" ON public.site_reports FOR DELETE USING (created_by = auth.uid() OR public.is_admin());

-- Notifications
CREATE POLICY "notifs_select" ON public.notifications FOR SELECT USING (true);
CREATE POLICY "notifs_insert" ON public.notifications FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "notifs_update" ON public.notifications FOR UPDATE USING (auth.uid() IS NOT NULL);

-- Messages
CREATE POLICY "messages_select" ON public.messages FOR SELECT USING (true);
CREATE POLICY "messages_insert_own" ON public.messages FOR INSERT WITH CHECK (sender_id = auth.uid());
CREATE POLICY "messages_delete_self_or_admin" ON public.messages FOR DELETE USING (sender_id = auth.uid() OR public.is_admin());

-- Attachments
CREATE POLICY "attachments_select" ON public.attachments FOR SELECT USING (true);
CREATE POLICY "attachments_insert" ON public.attachments FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "attachments_delete" ON public.attachments FOR DELETE USING (uploaded_by = auth.uid() OR public.is_admin());

-- Push subscriptions
CREATE POLICY "push_sub_select_self" ON public.push_subscriptions FOR SELECT USING (user_id = auth.uid());
CREATE POLICY "push_sub_insert_self" ON public.push_subscriptions FOR INSERT WITH CHECK (user_id = auth.uid());
CREATE POLICY "push_sub_delete_self" ON public.push_subscriptions FOR DELETE USING (user_id = auth.uid());

-- App settings
CREATE POLICY "app_settings_select" ON public.app_settings FOR SELECT USING (true);
CREATE POLICY "app_settings_insert_admin" ON public.app_settings FOR INSERT WITH CHECK (public.is_admin());
CREATE POLICY "app_settings_update_admin" ON public.app_settings FOR UPDATE USING (public.is_admin());

-- Audit log — yönetici görür, herkes yazar
CREATE POLICY "audit_log_select_admin" ON public.audit_log FOR SELECT USING (public.is_admin());
CREATE POLICY "audit_log_insert_auth" ON public.audit_log FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);

-- ============ FONKSIYONLAR ============

-- 90 günden eski bildirimleri temizle
CREATE OR REPLACE FUNCTION public.cleanup_old_notifications()
RETURNS integer LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE deleted_count integer;
BEGIN
  DELETE FROM public.notifications WHERE created_at < now() - interval '90 days';
  GET DIAGNOSTICS deleted_count = ROW_COUNT;
  RETURN deleted_count;
END $$;
GRANT EXECUTE ON FUNCTION public.cleanup_old_notifications() TO authenticated;

-- ============ STORAGE BUCKET ============
-- project-files bucket'i Supabase Dashboard > Storage'dan elle "public" olarak oluşturulmalı.
-- Sohbet dosyaları "chat/" klasörü altında saklanır.

-- ============ KURULUM SONU ============
-- Şimdi ucel_supabase_setup.sql çalıştırarak profilleri ekle.
