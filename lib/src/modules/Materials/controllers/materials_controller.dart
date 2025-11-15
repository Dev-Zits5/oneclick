import 'package:get/get.dart';
import '../models/material_model.dart';

class MaterialsController extends GetxController {
  // للتحكم في الفلتر
  var isFilterVisible = false.obs;
  void toggleFilterVisibility() => isFilterVisible.toggle();

  // --- (منطق ترقيم الصفحات) ---
  final int itemsPerPage = 2; // (للتجربة) 
  var currentPage = 1.obs;

  // (البيانات الكاملة)
  final List<MaterialModel> _masterItemsList = [
    MaterialModel(
      id: '1',
      name: 'طماطم',
      section: 'خضروات',
      sellPrice: '5',
      purchasePrice: '3',
      unit: 'كيلو',
    ),
    MaterialModel(
      id: '2',
      name: 'لحم مفروم',
      section: 'لحوم',
      sellPrice: '300',
      purchasePrice: '250',
      unit: 'كيلو',
    ),
    // (بيانات إضافية للتجربة)
    MaterialModel(
      id: '3',
      name: 'صدور دجاج',
      section: 'لحوم',
      sellPrice: '150',
      purchasePrice: '120',
      unit: 'كيلو',
    ),
  ];

  var pagedItems = <MaterialModel>[].obs;
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