class CaptainModel {
  final String id;
  final String name;          // اسم الكابتن
  final String phone1;        // تيليفون 1
  final String phone2;        // تيليفون 2
  final String address;       // عنوان
  final String birthDate;     // تاريخ الميلاد
  final bool isVisible;       // ظهور
  final bool isDefault;       // افتراضي

  CaptainModel({
    required this.id,
    required this.name,
    required this.phone1,
    required this.phone2,
    required this.address,
    required this.birthDate,
    required this.isVisible,
    required this.isDefault,
  });
}