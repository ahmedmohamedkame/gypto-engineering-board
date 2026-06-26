-- ============================================================
-- GYPTO Engineering System V15 - Recognition Dedicated Patch
-- Adds Recognition Board as a new engineering module.
-- Run this ONCE in Supabase SQL Editor after V13.
-- ============================================================

-- 1) Allow recognition_board as a module in engineering_records.
do $$
declare c record;
begin
  if to_regclass('public.engineering_records') is not null then
    for c in
      select conname
      from pg_constraint
      where conrelid = 'public.engineering_records'::regclass
        and contype = 'c'
        and pg_get_constraintdef(oid) ilike '%module%'
    loop
      execute format('alter table public.engineering_records drop constraint if exists %I', c.conname);
    end loop;

    alter table public.engineering_records
    add constraint engineering_records_module_check
    check (module in (
      'engineer_actions',
      'training_matrix',
      'maintenance_planning',
      'facility_board',
      'spare_parts',
      'projects_tracker',
      'budget_tracker',
      'recognition_board',
      'safety_board',
      'ccr_tracker',
      'capa_tracker',
      'equipment_register'
    ));
  end if;
end $$;

-- 2) Make sure area/department values used by Recognition are allowed.
do $$
declare c record;
begin
  if to_regclass('public.engineering_records') is not null then
    for c in
      select conname
      from pg_constraint
      where conrelid = 'public.engineering_records'::regclass
        and contype = 'c'
        and pg_get_constraintdef(oid) ilike '%area%'
    loop
      execute format('alter table public.engineering_records drop constraint if exists %I', c.conname);
    end loop;

    alter table public.engineering_records
    add constraint engineering_records_area_check
    check (area in (
      'Sterile',
      'Non-Sterile',
      'Electrical',
      'Utility',
      'Facility',
      'HVAC',
      'Water Treatment',
      'Purified Water',
      'Compressed Air',
      'Boiler',
      'Chiller',
      'Fire Fighting',
      'Civil / Building',
      'Warehouse',
      'QC Lab',
      'QA',
      'Production',
      'Packaging',
      'Admin Building',
      'External Area',
      'Planning',
      'Accounts',
      'Purchasing',
      'Engineering Management',
      'Maintenance Planning',
      'Production Planning'
    ));
  end if;
end $$;

-- 3) Useful indexes for faster recognition search/filtering.
create index if not exists idx_eng_records_module on public.engineering_records(module);
create index if not exists idx_eng_records_area on public.engineering_records(area);
create index if not exists idx_eng_records_extra_gin on public.engineering_records using gin (extra);

-- 4) Optional: grant access through existing RLS policies.
grant select, insert, update, delete on public.engineering_records to authenticated;

-- ============================================================
-- End of V15 patch
-- ============================================================
