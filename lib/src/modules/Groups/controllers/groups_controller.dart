import 'package:get/get.dart';
import '../models/group_model.dart';

class GroupsController extends GetxController {
  // للتحكم في الفلتر
  var isFilterVisible = false.obs;
  void toggleFilterVisibility() => isFilterVisible.toggle();

  // البيانات من الصورة
  final groups = <GroupModel>[
    GroupModel(
      id: '1',
      name: 'الحجم',
      printerName: 'printer 1',
      kitchenScreenNumber: '1',
      sectionCount: '1',
    ),
    GroupModel(
      id: '2',
      name: 'الاضافات',
      printerName: 'printer 2',
      kitchenScreenNumber: '2',
      sectionCount: '2',
    ),
  ].obs;
}