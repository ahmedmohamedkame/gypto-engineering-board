# GYPTO Engineering System V14 - Recognition Board

الإضافة الجديدة:
Recognition Board

الغرض:
تسجيل وتوثيق التكريم / التقدير للموظفين داخل الإدارات المختلفة.

الحقول:
- Employee Name
- Department / Management
- What did the person do?
- Recognition Type
- Recognition Date
- Recognized By
- Impact / Result
- Award Level
- Evidence URL
- Comments

طريقة التركيب:
1. افتح ملف supabase_v14_recognition_board_patch.sql.
2. انسخ الكود كله.
3. افتح Supabase > مشروع gypto-engineering-board > SQL Editor > New Query.
4. الصق الكود واضغط Run.
5. بعد Success، افتح Cloudflare > مشروع gypto-engineering-board.
6. Deployments > Create deployment.
7. ارفع ملف ZIP الجديد.
8. افتح الموقع واعمل Ctrl + F5.

ملاحظة:
لا يوجد تأثير على البيانات القديمة. القسم الجديد يستخدم نفس جدول engineering_records مع module = recognition_board.
