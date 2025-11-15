import 'package:get/get.dart';
import '../controllers/material_sections_controller.dart';

class MaterialSectionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaterialSectionsController>(() => MaterialSectionsController());
  }
}