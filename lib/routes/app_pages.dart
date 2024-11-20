import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:teqmavens_task/ui/splash/splash_controller.dart';
import 'package:teqmavens_task/ui/splash/splash_screen.dart';

import '../ui/home/home_controller.dart';
import '../ui/home/home_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.Home,
        page: () => HomePage(),
        binding: BindingsBuilder(
            () => Get.lazyPut<HomeController>(() => HomeController()))),
    GetPage(
        name: AppRoutes.SplashScreen,
        page: () => SplashScreen(),
        binding: BindingsBuilder(
            () => Get.lazyPut<SplashController>(() => SplashController()))),
      ];
}
