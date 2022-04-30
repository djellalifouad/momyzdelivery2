import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "delete_filter": "Delete Filter",
          "order_contains": "The order contain",
          "order_product": "products",
          "delivery_price": "Delivery price",
          "delivery_information": "Delivery Information",
          "order_place": "Order place",
          "order_delivered": "Order delivered",
          "taked_from": "Taked from",
          "to": "to",
          "store_name": "Store name",
          "order_qty": "Order quantity",
          "special_information": "Special information",
          "accept_order": "Accept order",
          "decline_order": "Decline order",
          "you_can_retry_after": "You can resend through",
          "second": "second",
          "resend": "Resend",
          "you_will_retrieve": "You will withdraw",
          "greyCard": "Grey card",
          "no_order": "There are no orders",
          "no_notification": "There are no notifications",
          "no_withdrawal": "There are no transactions",
          "no_complaint": "There are no complaints",
          "cant_send_message":
              "The complaint has been closed. No new messages can be sent",
          "products": "Products",
          "withdrawal_type1": "Order",
          "withdrawal_type2": "Money withdrawal",
          "min_error": "minimum withdrawal is",
          "transaction_success": "funds withdrawn successfully",
          "order_location": "Order location",
          "normal_delivery": "Normal Delivery",
          "express_delivery": "Express Delivery",
          "program_delivery": "Programmed  Delivery",
          "booked_delivery": "Booked Delivery",
          "ammount": "the amount",
          "withdtawal_detail": "Draw details",
          "number": "number",
          "please_enter_ammount": "Please enter the amount",
          "please_enter_withdtawal_detail": "Please enter withdrawal details",
          "please_enter_iban": "Please enter IBAN",
          "my_trans": "Transactions",
          "enter_message": "Enter message",
          "please_enter_title": "Please enter a title",
          "please_enter_desc": "Please enter description",
          "delete_car": "Do you really want to delete the image of this car?",
          "delete_car_desc": "delete car photo",
          "carUpdate": "Car update",
          "save": "Save",
          "confirm": "Confirm",
          "update_phone": "Update phone number",
          "success": "The operation was completed successfully",
          "wrongSms": "Wrong sms",
          "leave_app": "You will leave the app",
          "leave_desc":
              "Are you sure you want to leave the application This process is irreversible ?",
          "personal_info": "personal information",
          "settings": "Settings",
          "app_language": "Application language",
          "logout": "Logout",
          "cancel_delete": "cancel",
          "confirm_delete": "confirm delete",
          "delete_account_desc":
              "Are you sure you want to request deletion of your account on the application ?",
          "ondelivery": "Available",
          "to_home": "To home",
          "car_success": "Vehicle info added successfully",
          "please_enter_name_car": "Please enter the name car",
          "please_enter_type_car": "Please enter type car",
          "please_enter_matricule": "Please enter matricule",
          "please_enter_carPicture": "Please enter car pictures",
          "please_enter_grey_card": "Please enter grey card",
          "personal_success": "Your personal information added successfully",
          "enter_work_info": "In this step enter the business information",
          "greyNumber": "gray card image ",
          "verify_phone": "Verify phone",
          "please_add_ids_pic": "Please enter all required files",
          "please_enter_your_personal_id_number":
              "Please enter the identification number",
          "welcome_desc3": "In this step enter your personal information",
          "id": "Identification Number ",
          "id_pic": "ID photo",
          "per_pic": "Driver's license copy",
          "error": "There was a problem, please try again later",
          "pleaser_enter_a_correct_number": "Pleaser enter a correct number",
          "already_have_account": "Already have account",
          "user_already_exist": "User already exists",
          "please_enter_delivery_type": "Please enter delivery type",
          "please_enter_phone_number": "Please enter phone number",
          "please_enter_fullName": "Please enter fullName ",
          "normaDelivery": "Normal delivery",
          "fastDelivery": "express delivery",
          "write_your_message": "Write your message here ",
          'complaint2': "complaints",
          "complaint2_open": "closed complaints",
          "complaint2_close": "open complaints",
          "done": "answered ",
          "not_done": "Waiting for reply",
          "open_new_complaint2": "Open a new complaint",
          "add_text": "Enter text here",
          "choose": "optional",
          "complaint_market": "Report a store",
          "reason_complaint": "Reason for reporting",
          "complaint": "Report",
          "complaint_body2": "Reporting description",
          "on_review": "under review",
          "signaled_success": "Blocked",
          "add_files_or_pics": "Attach photos or files",
          "open_complaint": "open a complaint",
          "complaint_reason": "Reason for complaint",
          "choose_reason": "Choose the reason",
          "complaint_body": "Complaint content",
          "complaint_body_desc2":
              "Please enter all necessary information here ",
          "send_complaint": "Submit Complaint",
          "delivery2": "Delivery method",
          "delivery3": "Delivery method",
          "order_detail_title": "Order date and information",
          "product_details": "Product information",
          "price": "price",
          "date": "Date",
          "sended_to": "consignee",
          "delivery_address": "Delivery Address",
          "option": "the means",
          "qty": "Quantity",
          "open_invoice": "Opening the order invoice",
          "make_complaint2": "open a complaint",
          "invoice_title": "order invoice",
          "order_number": "order number",
          "product": "the product",
          "tax": "Tax",
          "total": "Total amount",
          "share_invoice": "Share the bill",
          "market": 'Market',
          'delivery_price2': "Delivery price",
          "orders": "Orders",
          "read_all_notif": "read all notifications",
          "notifcations": "Notifications",
          "today": 'Today',
          "delete_file": "delete file",
          "card_grey": "Gray card",
          "vehicule_pic": "Vehicle Pictures",
          "vehicule_type2": "Vehicle files",
          "my_profile": "My profile",
          "profile": "my profile",
          "edit_profile": "Edit profile",
          "deliver_vehicule": "delivery method",
          "general": "General",
          "signals": "Reports",
          "make_complaint": "Make a complaint",
          "politics": "Privacy policy ",
          "conditions": "Terms of use",
          "delete_account": "Account deletion request",
          "name_vehicule2": "Vehicle name ",
          "type_vehicule2": "the type of the vehicle",
          "number_matricule": "Plate Number ",
          "my_benifit": "my benifits",
          "my_benifit_month": "Your withdrawable income this month",
          "withdrawal2": "money withdrawal",
          "stats": "statistics",
          "avg_benifit": "average delivery price",
          "sum_order": "number of orders ",
          "available _to_withdrawal": "Possible to withdrawal",
          "withdrawal": "withdrawn",
          "total": "Total",
          "you_will_withdarawal": "will pull",
          'totalDistance': "total distance",
          "totalTime": "total time",
          "open_map": "open principal map ",
          "no_pic": "There is no pic",
          "code_activation": "Verification code",
          "code_activation_desc":
              "You will receive a confirmation code in the number you entered, please make sure and enter the correct number",
          "code_activation_confirmation": "Confirm the arrival of the order",
          "product_picture": "Product delivery picture",
          "order_received": "The order has been received",
          'welcome': 'welcome again !',
          'welcome_desc2': "Create your account and start experimenting",
          'welcome_desc': 'Log in to your account and let the fun begin',
          'phone_number': 'Phone number',
          'enter_phone_number': 'Enter your phone number',
          'login': 'Login',
          'not_have_account': "Don't have an account?",
          'create_account': 'open a new account',
          'welcome2': 'Welcome !',
          'fullName': 'Full name',
          'address': 'Address',
          'enter_address': "Enter address",
          'enter_fullName': "Enter fullname",
          'next_step': 'Next Step',
          'enter_delivery_type': 'Enter delivery type',
          'delivery_type': 'Delivery Type',
          'vehicule_type': 'Vehicle plate number',
          'name_vehicule': 'Vehicle name and type',
          'enter_vehicule_type': 'Enter vehicle plate number',
          'enter_name_vehicule': 'Enter vehicle name and type',
          'thanks_for_registring': "Thanks for registering",
          'thanks_wait':
              "You will receive a phone message regarding the acceptance of your request by the administration. Thank you for your interest",
        },
        'ar_AR': {
          "delete_filter": "إلغاء فلتر",
          "order_contains": "الطلب يحتوي على",
          "order_products": "منتجات",
          "delivery_price": "سعر التوصيلة",
          "delivery_information": "معلومات التوصيل",
          "order_place": "مكان التوصيل ",
          "order_delivered": "تم توصيل الطلب",
          "taked_from": "أخد الطلب من ",
          "to": "إلى ",
          "store_name": "إسم المحل ",
          "order_qty": "كمية الطلبية ",
          "special_information": "معلومات خاصة ",
          "accept_order": "قبول الطلب",
          "decline_order": "رفض الطلب  ",
          "you_can_retry_after": "يمكنك اعادة إرسال خلال",
          "second": "ثانية",
          "resend": "إعادة الإرسال ",
          "you_will_retrieve": "سوف تقوم بسحب ",
          "greyCard": "البطاقة الرمادية ",
          "no_order": "لا يوجد أي طلبيات ",
          "no_notification": "لا يوجد أي اشعارات",
          "no_withdrawal": "لايوجد أي معاملات",
          "no_complaint": "لا يوجد أي شكاوي ",
          "cant_send_message": "لقد تم إغلاق الشكوى لا يمكن إرسال رسائل جديدة",
          "products": "المنتجات ",
          "withdrawal_type1": "طلبية",
          "withdrawal_type2": "سحب الأموال",
          "min_error": "الحد الأدنى للسحب هو ",
          "transaction_success": "تم سحب الأموال بنجاح ",
          "order_location": "موقع الطلب ",
          "normal_delivery": "توصيل عادي",
          "express_delivery": "توصيل سريع",
          "program_delivery": "توصيل مبرمج",
          "booked_delivery": "توصيل مؤقت",
          "ammount": "المبلغ",
          "withdtawal_detail": "تفاصيل السحب ",
          "number": "رقم",
          "please_enter_ammount": "يرجى إدخال المبلغ",
          "please_enter_withdtawal_detail": "يرجى إدخال تفاصيل السحب ",
          "please_enter_iban": "يرجى إدخال IBAN ",
          "my_trans": "المعاملات",
          "enter_message": "يرجى ارسال رسالة ",
          "please_enter_title": "يرجى إدخال عنوان للشكوى",
          "please_enter_desc": "يرجى إدخال نص الشكوى",
          "delete_car": "هل تريد حقا حذف صورة هذه السيارة ؟",
          "delete_car_desc": "حذف صورة السيارة",
          "carUpdate": "معلومات المركبة",
          "save": "حفظ التعديلات",
          "confirm": "تأكيد",
          "update_phone": "تغيير رقم الهاتف",
          "wrongSms": "يرجى إدخال الكود الصحيحح ",
          "success": "تمت العملية بنجاح ",
          "leave_app": "مغادرة التطبيق",
          "leave_desc":
              "هل أنت متأكد أنك تريد مغادرة التطبيق هذه العملية لا يمكن الرجوع فيها ?",
          "personal_info": "المعلومات الشخصية",
          "settings": "الإعدادات",
          "app_language": "لغة التطبيق ",
          "logout": "تسجيل الخروج ",
          "cancel_delete": "الغاء العملية",
          "confirm_delete": "تأكيد الحدف ",
          "delete_account_desc":
              "هل أنت متأكد من أنك تريد طلب حذف حسابك على التطبيق ؟",
          "ondelivery": "متوفر للتوصيل",
          "to_home": "التوجه إلى الرئسية",
          "car_success": "تم إضافة معلومات السيارة بنجاح ",
          "please_enter_name_car": "الرجاء إدخال اسم السيارة",
          "please_enter_type_car": "الرجاء إدخال نوع السيارة",
          "please_enter_matricule": "الرجاء إدخال رقم السيارة",
          "please_enter_carPicture": "الرجاء إدخال صور السيارة",
          "please_enter_grey_card": "الرجاء إدخال البطاقة الرمادية",
          "personal_success": "تم إضافة معلوماتك الشخصية بنجاح ",
          "enter_work_info": "في هذه الخطوة أدخل معلومات العمل ",
          "greyNumber": "صورة البطاقة الرمادية ",
          "verify_phone": "تأكيد رقم الهاتف ",
          "please_add_ids_pic": "يرجى إدخال جميع الملفات المطلوبة  ",
          "please_enter_your_personal_id_number": "يرجى إدخال رقم التعريف ",
          "welcome_desc3": "في هذه الخطوة قوم بادخال المعلومات الشخصية ",
          "id": "رقم التعريف ",
          "id_pic": "صورة بطاقة التعريف ",
          "per_pic": "صورة رخصة السياقة ",

          "error": "حدت مشكل يرجى إعادة المحاولة لاحقاً ",
          "pleaser_enter_a_correct_number": "يرجى إدخال رقم صحيح ",
          "already_have_account": "لديك حساب بالفعل ؟ ",
          "user_already_exist": "هذا المستخذم موجود من قبل ",
          "please_enter_delivery_type": "الرجاء إدخال نوع التوصيل",
          "please_enter_phone_number": "الرجاء إدخال رقم الهاتف",
          "please_enter_fullName": "الرجاء إدخال الاسم الكامل",
          "normaDelivery": "توصيل عادي",
          "fastDelivery": "توصيل سريع",
          "vehicule_type2": "ملفات المركبة ",
          "write_your_message": "اكتب رسالتك هنا ",
          'complaint2': "الشكاوى",
          "complaint2_open": "شكاوى مغلوقة ",
          "complaint2_close": "شكاوى مفتوحة",
          "done": "تم الرد ",
          "not_done": "في انتظار الرد ",
          "open_new_complaint2": "فتح شكوى جديدة ",
          "complaint_market": "الإبلاغ عن متجر ",
          "reason_complaint": "سبب التبليغ ",
          "complaint": "التبليغ",
          "complaint_body2": "وصف الإبلاغ",
          "on_review": "قيد المراجعة ",
          "signaled_success": "تم الحظر ",
          "add_text": "أدخل النص هنا ",
          "choose": "إختياري ",
          "add_files_or_pics": "إرفاق الصور أو الملفات ",
          "open_complaint": "فتح شكوى ",
          "complaint_reason": "سبب الشكوى ",
          "choose_reason": "إختيار السبب ",
          "complaint_body": "محتوى الشكوى",
          "complaint_body_desc2": "من فضلك أدخل كامل المعلومات الضرورية هنا ",
          "send_complaint": "إرسال الشكوى ",
          "complaint_body_desc": "محتوى الشكوى",
          "delivery2": "طريقة التوصيل ",
          "delivery3": "وسيلة التوصيل",
          "order_detail_title": "تاريخ و معلومات الطلب ",
          "product_details": "معلومات المنتج ",
          "price": "السعر ",
          "date": "التاريخ",
          "sended_to": "المرسل إليه ",
          "delivery_address": "عنوان التوصيل ",
          "option": "الوسيلة ",
          "qty": "الكمية",
          "open_invoice": "فتح فاتورة الطلب ",
          "make_complaint2": "فتح شكوى ",
          "invoice_title": "فاتورة الطلب ",
          "order_number": "رقم الطلب ",
          "product": "المنتج ",
          "tax": "الضريبة ",
          "total": "المبلغ الإجمالي ",
          "share_invoice": "مشاركة الفاتورة ",

          /////
          "market": 'المتجر',
          'delivery_price2': "سعر التوصيل",
          "orders": "الطلبات",
          "read_all_notif": "قرائ ة كل الإشعارات",
          "notifications": "الإشعارات",
          'today': "اليوم",
          "delete_file": "حذف الملف ",
          "card_grey": "البطاقة الرمادية ",
          "vehicule_pic": "صور المركبة ",
          "vehicule_type": "ملفات المركبة ",
          "my_profile": "بروفايلي الشخصي",
          "profile": "بروفايلي",
          "edit_profile": "تعديل البروفايل ",
          "deliver_vehicule": "وسيلة التوصيل",
          "general": "العام",
          "signals": "الابلاغات",
          "make_complaint": "تقديم شكوى ",
          "politics": "سياسة الخصوصية ",
          "conditions": " شروط الإستخدام",
          "delete_account": "طلب حدف الحساب",
          "name_vehicule2": "إسم المركبة ",
          "type_vehicule2": "نوع المركبة",
          "number_matricule": "رقم اللوحة ",
          "my_benifit": "مداخيلي ",
          "my_benifit_month": "مدخولك القابل للسحب هذا الشهر ",
          "withdrawal": "سحب الأموال ",
          "stats": "إحصائيات",
          "avg_benifit": "متوسط ثمن التوصيل ",
          "sum_order": "عدد الطلبات ",
          "available _to_withdrawal": "قابل للسحب ",
          "withdrawal2": "تم سحبه ",
          "total": "الإجمالي",
          "you_will_withdarawal": "ستقوم بسحب مبلغ",
          'totalDistance': "المسافة الإجمالية ",
          "totalTime": "الوقت الإجمالي ",
          "open_map": "فتح الخريطة الرئيسية ",
          "no_pic": "لا توجد أي صورة",
          "code_activation": "كود التأكيد ",
          "code_activation_desc":
              "سيصلك كود التأكيد في الرقم الذي أدخلته ، رجاء تأكد و إدخال الرقم صحيح ",
          "code_activation_confirmation": "تأكيد وصول الطلب  ",
          "product_picture": "صورة توصيل المنتج",
          "order_received": "تم وصول الطلب ",
          'welcome': 'مرحباً بك مجدداً !',
          'welcome_desc2': "انشئ حسابك وأبدأ التجربة",
          'welcome_desc': 'سجل دخولك إلى حسابك ودع المتعة تبدأ ',
          'phone_number': 'رقم الهاتف',
          'enter_phone_number': 'أدخل رقم الهاتف',
          'login': 'تسجيل الدخول ',
          'not_have_account': 'ليس لديك حساب  ؟ ',
          'create_account': 'فتح حساب جديد',
          'welcome2': "مرحباً بك ! ",
          'fullName': 'الاسم الكامل',
          'address': 'عنوان',
          'next_step': 'الخطوة التالية',
          'enter_address': "أدخل العنوان",
          'enter_fullName': "أدخل الاسم الكامل",
          'delivery_type': 'نوع التوصيل',
          'enter_delivery_type': 'أدخل نوع التوصيل',
          'vehicule_type': 'رقم لوحة المركبة',
          'name_vehicule': 'إسم ونوع المركبة',
          'enter_vehicule_type': 'أدخل رقم لوحة المركبة',
          'enter_name_vehicule': 'أدخل اسم السيارة ونوعها',
          'thanks_for_registring': "شكرا على التسجيل",
          'thanks_wait':
              "ستتلقى رسالة هاتفية في حل قبول طلبك من طرف الإداراة شكرا على الإهتمام",
        }
      };
}
