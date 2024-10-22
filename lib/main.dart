import 'package:flutter/material.dart';
import 'package:kartex_web/product/constants/string_constants.dart';
import 'package:kartex_web/config/routes/app_routes.dart';
import 'package:kartex_web/config/routes/navigator_service.dart';
import 'package:kartex_web/config/theme/application_theme.dart';
import 'package:kartex_web/core/init/app_init.dart';

void main() async {
  final appInit = AppInitImpl();
  await appInit.run();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appName,
      theme: CustomDarkTheme().themeData,
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigatorService.navigatorKey,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
