import 'package:get/get.dart';
import '../models/material_section_model.dart';

class MaterialSectionsController extends GetxController {
  // للتحكم في الفلتر
  var isFilterVisible = false.obs;
  void toggleFilterVisibility() => isFilterVisible.toggle();

  // --- (منطق ترقيم الصفحات) ---
  final int itemsPerPage = 2; // (للتجربة) 
  var currentPage = 1.obs;

  // (البيانات الكاملة من الصورة)
  final List<MaterialSectionModel> _masterItemsList = [
    MaterialSectionModel(
      id: '1',
      name: 'لحوم',
      description: 'قسم اللحوم',
    ),
    MaterialSectionModel(
      id: '2',
      name: 'خضروات',
      description: 'قسم الخضروات',
    ),
    // (بيانات إضافية للتجربة)
    MaterialSectionModel(
      id: '3',
      name: 'مشروبات',
      description: 'قسم المشروبات',
    ),
  ];

  var pagedItems = <MaterialSectionModel>[].obs;
  late int totalPages;

  @override
  void onInit() {
    super.onInit();
    totalPages = (_masterItemsList.length / itemsPerPage).ceil();
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