-- ============================================================
-- GYPTO Engineering System V16 - CAPA Quality / Safety Patch
-- Purpose:
-- CAPA records are divided in the frontend by extra.capa_type:
-- Quality CAPA or Safety CAPA.
-- No new table is required because CAPA details are stored in engineering_records.extra JSONB.
-- Run this ONCE in Supabase SQL Editor after V15.
-- ============================================================

-- Make sure CAPA module is allowed in engineering_records module constraint.
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

-- Helpful index for searching/filtering CAPA type inside extra JSON.
create index if not exists idx_eng_records_capa_type
on public.engineering_records ((extra->>'capa_type'))
where module = 'capa_tracker';

create index if not exists idx_eng_records_capa_source_department
on public.engineering_records ((extra->>'source_department'))
where module = 'capa_tracker';

grant select, insert, update, delete on public.engineering_records to authenticated;

-- ============================================================
-- End of V16 patch
-- ============================================================
