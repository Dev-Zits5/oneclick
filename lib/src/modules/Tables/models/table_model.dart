class TableModel {
  final String id;
  final String name;          // الإسم
  final String personCount;   // عدد الأفراد
  final String status;        // الحالات
  final String branch;        // الفرع
  final String hall;          // الصالة

  TableModel({
    required this.id,
    required this.name,
    required this.personCount,
    required this.status,
    required this.branch,
    required this.hall,
  });
}