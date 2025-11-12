class GroupModel {
  final String id;
  final String name;                // اسم المجموعه
  final String printerName;         // اسم الطابعه
  final String kitchenScreenNumber; // رقم شاشة المطبخ
  final String sectionCount;        // عدد الأقسام

  GroupModel({
    required this.id,
    required this.name,
    required this.printerName,
    required this.kitchenScreenNumber,
    required this.sectionCount,
  });
}