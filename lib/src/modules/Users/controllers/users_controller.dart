import 'package:get/get.dart';
import '../models/user_model.dart';

class UsersController extends GetxController {
  // للتحكم في الفلتر
  var isFilterVisible = false.obs;
  void toggleFilterVisibility() => isFilterVisible.toggle();

  // --- (منطق ترقيم الصفحات) ---
  final int itemsPerPage = 2; // (للتجربة) 
  var currentPage = 1.obs;

  // (البيانات الكاملة من الصورة)
  final List<UserModel> _masterItemsList = [
    UserModel(
      id: '1',
      name: 'zits',
      username: 'zits',
      email: 'zits@gmail.com',
      branch: 'فرع 1',
      isManager: true,
      canLogin: true,
    ),
    UserModel(
      id: '2',
      name: 'test',
      username: 'test',
      email: 'test@gmail.com',
      branch: 'فرع 1',
      isManager: false,
      canLogin: false,
    ),
  ];

  var pagedItems = <UserModel>[].obs;
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