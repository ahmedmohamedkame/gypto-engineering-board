# GYPTO Engineering System V16 - CAPA Quality / Safety

التعديل:
CAPA Tracker بقى متقسم إلى:
- Quality CAPA
- Safety CAPA

والصفحة أصبحت مخصصة وتعرض:
- CAPA Type
- Source Department
- Title
- Owner
- Root Cause
- Corrective Action
- Preventive Action
- Effectiveness Check
- Status
- Target
- Evidence

طريقة التركيب:
1. افتح ملف supabase_v16_capa_quality_safety_patch.sql.
2. انسخ الكود كله.
3. افتح Supabase > مشروع gypto-engineering-board > SQL Editor > New Query.
4. الصق الكود واضغط Run.
5. بعد Success، افتح Cloudflare > مشروع gypto-engineering-board.
6. Deployments > Create deployment.
7. ارفع ملف ZIP الجديد.
8. افتح الموقع واعمل Ctrl + F5.

ملاحظة:
CAPA القديمة ستظل موجودة، لكن أي CAPA جديد ستختار له نوع Quality CAPA أو Safety CAPA.
