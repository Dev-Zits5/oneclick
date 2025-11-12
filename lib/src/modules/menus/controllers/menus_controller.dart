import 'package:get/get.dart';
import '../models/menu_model.dart';

class MenusController extends GetxController {
  // بيانات الجدول (مطابقة للصورة: صف واحد فقط)
  final menus = <MenuModel>[
    MenuModel(id: '1', name: 'المنيو الرئيسية'),
  ].obs;

  // تحكم بسيط لو احتجت تظهر/تخفي فلتر لاحقاً
  var isFilterVisible = false.obs;
  void toggleFilterVisibility() => isFilterVisible.toggle();
}
