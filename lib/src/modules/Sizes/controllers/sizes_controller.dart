import 'package:get/get.dart';
import '../models/size_model.dart';

class SizesController extends GetxController {
  // للتحكم في الفلتر
  var isFilterVisible = false.obs;
  void toggleFilterVisibility() => isFilterVisible.toggle();

  // --- (منطق ترقيم الصفحات) ---
  final int itemsPerPage = 2; // (للتجربة)
  var currentPage = 1.obs;

  // (البيانات الكاملة من الصورة)
  final List<SizeModel> _masterItemsList = [
    SizeModel(id: '1', name: 'بيتزا جامبو', sizeValue: '25'),
    SizeModel(id: '2', name: '  كريب كبير', sizeValue: '35'),
  ];

  var pagedItems = <SizeModel>[].obs;
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
    pagedItems.assignAll(_masterItemsList.sublist(startIndex, endIndex));
  }
}
