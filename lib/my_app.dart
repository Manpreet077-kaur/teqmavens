import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:teqmavens_task/helper/string_constants.dart';
import 'package:teqmavens_task/repository/api_repo.dart';

import 'helper/theme_service.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      title: StringConstants.weatherApp,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeService().theme,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<ApiRepo>(() => ApiRepo(), fenix: true);
      }),
      builder: (context, widget) {
        return MediaQuery(data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1.0),
        ), child: widget!);
      },
      getPages: AppPages.pages,
      initialRoute: AppRoutes.SplashScreen,
    );
  }
}
