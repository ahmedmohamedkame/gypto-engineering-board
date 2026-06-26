# GYPTO Engineering System V15 - Dedicated Recognition Board

التعديل:
صفحة Recognition Board أصبحت مخصصة بالكامل وليست جدول عام.

الأعمدة الظاهرة:
- Employee Name
- Department / Management
- What did the person do?
- Recognition Type
- Recognition Date
- Recognized By
- Impact / Result
- Award Level
- Status
- Evidence
- Actions

النموذج عند الضغط على + New Recognition يحتوي على نفس الحقول بوضوح.

طريقة التركيب:
1. لو لم تشغل SQL الخاص بالـ Recognition من قبل:
   افتح supabase_v15_recognition_dedicated_patch.sql وشغله في Supabase.
   لو كنت شغلت V14 SQL وظهر القسم بالفعل، يمكنك تخطي خطوة SQL.
2. افتح Cloudflare > مشروع gypto-engineering-board.
3. Deployments > Create deployment.
4. ارفع ملف ZIP الجديد.
5. افتح الموقع واعمل Ctrl + F5.

مهم:
الحقول تظهر عند الضغط على زر + New Recognition.
والجدول الآن يعرض نفس الحقول كأعمدة واضحة.
