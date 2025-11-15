class DriverModel {
  final String id;
  final String name;          // اسم الطيار
  final String phone1;        // تيليفون 1
  final String phone2;        // تيليفون 2
  final String address;       // عنوان
  final String birthDate;     // تاريخ الميلاد
  final bool showForDelivery; // ظهور لتوصيل الطلبات
  final bool isDefault;       // افتراضي

  DriverModel({
    required this.id,
    required this.name,
    required this.phone1,
    required this.phone2,
    required this.address,
    required this.birthDate,
    required this.showForDelivery,
    required this.isDefault,
  });
}