import 'package:get/get.dart';
import '../controllers/captains_controller.dart';

class CaptainsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CaptainsController>(() => CaptainsController());
  }
}