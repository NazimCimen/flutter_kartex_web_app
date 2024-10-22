import 'package:flutter/material.dart';
import 'package:kartex_web/feature/catolog/presentation/catolog_view.dart';
import 'package:kartex_web/feature/contact_us/presentation/view/contact_form_view.dart';
import 'package:kartex_web/feature/home/view/home_view.dart';

@immutable
final class AppRoutes {
  const AppRoutes._();

  static const String initialRoute = '/homeView';
  static const String homeView = '/homeView';
  static const String contactFormView = '/contactFormView';
  static const String catalogView = '/catalogView';

  static Map<String, WidgetBuilder> get routes => {
        homeView: (context) => const HomeView(),
        contactFormView: (context) => const ContactFromView(),
        catalogView: (context) => const CatalogView(),
      };
}
