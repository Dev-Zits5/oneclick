import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click/src/modules/home/controllers/home_controller.dart';
import 'package:one_click/src/routes/app_pages.dart'; 
import 'package:one_click/src/shared/constants/app_colors.dart';
import 'package:one_click/src/modules/home/widgets/side_navigation_bar.dart';
// --- 1. (جديد) استيراد الصفحات ---
import 'package:one_click/src/modules/dashboard/views/dashboard_view.dart';
import 'package:one_click/src/modules/units/views/units_view.dart';
import 'package:one_click/src/modules/menus/views/menus_view.dart'; // <-- جديد
import 'package:one_click/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:one_click/src/modules/units/bindings/units_binding.dart';
import 'package:one_click/src/modules/menus/bindings/menus_binding.dart'; // <-- جديد
// import 'package:one_click/src/routes/app_routes.dart'; 


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.grey[100],
      
      drawer: SideNavigationBar(),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.scrollToTop(); 
        },
        backgroundColor: AppColors.primary, 
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      ),
      
      body: SafeArea(
        child: Navigator(
          key: controller.navigatorKey, 
          initialRoute: Paths.dashboard, 
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case Paths.dashboard:
                return GetPageRoute(
                  page: () => const DashboardView(),
                  binding: DashboardBinding(),
                );
              case Paths.units:
                return GetPageRoute(
                  page: () => const UnitsView(),
                  binding: UnitsBinding(),
                );
              // --- 2. (جديد) إضافة المسار ---
              case Paths.menus:
                return GetPageRoute(
                  page: () => const MenusView(),
                  binding: MenusBinding(),
                );
              
              default:
                return GetPageRoute(
                  page: () => Center(child: Text('Page not found: ${settings.name}')),
                );
            }
          },
        ),
      ),
    );
  }
}