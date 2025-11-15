import 'package:get/get.dart';
import '../controllers/halls_controller.dart';

class HallsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HallsController>(() => HallsController());
  }
}