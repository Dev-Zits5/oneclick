import 'package:get/get.dart';
import '../controllers/delivery_zones_controller.dart';

class DeliveryZonesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryZonesController>(() => DeliveryZonesController());
  }
}