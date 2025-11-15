import 'package:get/get.dart';
import '../models/driver_model.dart';

class DriversController extends GetxController {
  // للتحكم في الفلتر
  var isFilterVisible = false.obs;
  void toggleFilterVisibility() => isFilterVisible.toggle();

  // --- (منطق ترقيم الصفحات) ---
  final int itemsPerPage = 2; // (للتجربة) 
  var currentPage = 1.obs;

  // (البيانات الكاملة من الصورة)
  final List<DriverModel> _masterItemsList = [
    DriverModel(
      id: '1',
      name: 'zits',
      phone1: '010xxxxxxx',
      phone2: '011xxxxxxx',
      address: 'cairo',
      birthDate: '1/1/2000',
      showForDelivery: true,
      isDefault: true,
    ),
    DriverModel(
      id: '2',
      name: 'test',
      phone1: '010xxxxxxx',
      phone2: '011xxxxxxx',
      address: 'cairo',
      birthDate: '1/1/2000',
      showForDelivery: false,
      isDefault: false,
    ),
  ];

  var pagedItems = <DriverModel>[].obs;
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