import 'package:get/get.dart';

// (تأكد أن كل هذه المسارات تبدأ بـ .../src/...)
import 'package:one_click/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:one_click/src/modules/dashboard/views/dashboard_view.dart';
import 'package:one_click/src/modules/home/bindings/home_binding.dart';
import 'package:one_click/src/modules/home/views/home_view.dart';
import 'package:one_click/src/modules/login/bindings/login_binding.dart';
import 'package:one_click/src/modules/login/views/login_view.dart';
import 'package:one_click/src/modules/units/bindings/units_binding.dart';
import 'package:one_click/src/modules/units/views/units_view.dart';
// --- 1. (جديد) استيراد الملفات الجديدة ---
import 'package:one_click/src/modules/menus/bindings/menus_binding.dart';
import 'package:one_click/src/modules/menus/views/menus_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Paths.login, // المسار: /login
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    
    GetPage(
      name: Paths.home, // المسار: /home
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}