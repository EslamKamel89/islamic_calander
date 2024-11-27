import 'package:flutter/material.dart';
import 'package:islamic_calander/core/router/app_routes_names.dart';
import 'package:islamic_calander/core/router/middleware.dart';
import 'package:islamic_calander/core/widgets/splash_screen.dart';
import 'package:islamic_calander/features/date_conversion/presentation/views/date_conversion_view.dart';

class AppRouter {
  AppMiddleWare appMiddleWare;
  AppRouter({required this.appMiddleWare});
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    String? routeName = appMiddleWare.middlleware(routeSettings.name);
    switch (routeName) {
      case AppRoutesNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: routeSettings,
        );
      case AppRoutesNames.dateConversionView:
        return MaterialPageRoute(
          builder: (context) => const DateConversionView(),
          settings: routeSettings,
        );

      default:
        return null;
    }
  }
}
