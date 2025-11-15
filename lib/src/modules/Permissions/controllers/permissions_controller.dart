import 'package:get/get.dart';
import '../models/permission_model.dart';

class PermissionsController extends GetxController {
  // للتحكم في الفلتر
  var isFilterVisible = false.obs;
  void toggleFilterVisibility() => isFilterVisible.toggle();

  // --- (منطق ترقيم الصفحات) ---
  final int itemsPerPage = 2; // (للتجربة) 
  var currentPage = 1.obs;

  // (البيانات الكاملة من الصورة)
  final List<PermissionModel> _masterItemsList = [
    PermissionModel(
      username: 'zits',
      groupName: 'مسئول',
      permissionCode: '1000',
      permissionName: 'عرض الوحدات',
      isAllowed: true,
    ),
    PermissionModel(
      username: 'zits',
      groupName: 'مسئول',
      permissionCode: '1001',
      permissionName: 'اضافة وحده',
      isAllowed: false,
    ),
  ];

  var pagedItems = <PermissionModel>[].obs;
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