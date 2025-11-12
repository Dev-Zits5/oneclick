import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menus_controller.dart';

class MenusView extends GetView<MenusController> {
  const MenusView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          // عنوان الصفحة مطابق للصورة
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'سجل المينوهات',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // الصندوق الأبيض والجدول
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() => _buildTable()),
                ),

                const SizedBox(height: 12),

                // Pagination بسيطة كما في الصورة (صفحة واحدة)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _pageButton('الأخير', onTap: () {}),
                    const SizedBox(width: 8),
                    _pageButton('1', isSelected: true, onTap: () {}),
                    const SizedBox(width: 8),
                    _pageButton('الأول', onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTable() {
    const headerStyle = TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold);
    const bodyStyle = TextStyle(fontSize: 14, color: Colors.black87);

    final borderColor = Colors.grey.shade300;

    return Table(
      columnWidths: const {
        0: FixedColumnWidth(60),  // #
        1: FixedColumnWidth(300), // اسم المينو
      },
      border: TableBorder.all(color: borderColor, width: 1),
      children: [
        // Header
        TableRow(
          decoration: BoxDecoration(color: Colors.blue[700]),
          children: [
            _headerCell('#', headerStyle),
            _headerCell('اسم المينو', headerStyle),
          ],
        ),

        // Rows (من بيانات controller)
        ...controller.menus.map((m) {
          return TableRow(
            decoration: BoxDecoration(color: controller.menus.indexOf(m).isEven ? Colors.white : Colors.grey.shade50),
            children: [
              _bodyCell(m.id, bodyStyle),
              _bodyCell(m.name, bodyStyle),
            ],
          );
        }).toList(),
      ],
    );
  }

  TableCell _headerCell(String text, TextStyle style) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(text, style: style, textAlign: TextAlign.center),
      ),
    );
  }

  TableCell _bodyCell(String text, TextStyle style) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(text, style: style, textAlign: TextAlign.center),
      ),
    );
  }

  Widget _pageButton(String label, {bool isSelected = false, required VoidCallback onTap}) {
    return Material(
      color: isSelected ? Colors.blue[700] : Colors.grey[200],
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
