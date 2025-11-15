class MaterialModel {
  final String id;
  final String name;          // اسم الخامة
  final String section;       // القسم
  final String sellPrice;     // سعر البيع
  final String purchasePrice; // سعر الشراء
  final String unit;          // الوحده

  MaterialModel({
    required this.id,
    required this.name,
    required this.section,
    required this.sellPrice,
    required this.purchasePrice,
    required this.unit,
  });
}