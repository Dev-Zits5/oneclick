import 'package:get/get.dart';
import '../controllers/sizes_controller.dart';

class SizesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SizesController>(() => SizesController());
  }
}