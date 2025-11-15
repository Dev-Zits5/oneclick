import 'package:get/get.dart';
import '../models/table_model.dart';

class TablesController extends GetxController {
  // للتحكم في الفلتر
  var isFilterVisible = false.obs;
  void toggleFilterVisibility() => isFilterVisible.toggle();

  // --- (منطق ترقيم الصفحات) ---
  final int itemsPerPage = 2; // (للتجربة) 
  var currentPage = 1.obs;

  // (البيانات الكاملة من الصورة)
  final List<TableModel> _masterItemsList = [
    TableModel(
      id: '1',
      name: 'T1',
      personCount: '4',
      status: 'available', // (الحالة الافتراضية)
      branch: 'فرع 1',
      hall: 'الرئيسية',
    ),
    TableModel(
      id: '2',
      name: 'T2',
      personCount: '6',
      status: 'available', // (الحالة الافتراضية)
      branch: 'فرع 1',
      hall: 'الرئيسية',
    ),
  ];

  var pagedItems = <TableModel>[].obs;
  late int totalPages;

  @override
  void onInit() {
    super.onInit();
    totalPages = (_masterItemsList.length / itemsPerPage).ceil();
    if (totalPages == 0) totalPages = 1; // (لمنع الخطأ إذا كانت القائمة فارغة)
    changePage(1); 
  }

  void changePage(int pageIndex) {
    currentPage.value = pageIndex;
    int startIndex = (pageIndex - 1) * itemsPerPage;
    int endIndex = (startIndex + itemsPerPage);
    
    if (endIndex > _masterItemsList.length) {
      endIndex = _masterItemsList.length;
    }
    pagedItems.assignAll(
      _masterItemsList.sublist(startIndex, endIndex),
    );
  }
}