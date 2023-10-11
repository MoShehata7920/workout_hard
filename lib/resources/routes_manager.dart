import 'package:flutter/material.dart';
import 'package:workout_hard/resources/strings_manager.dart';
import 'package:workout_hard/screens/details_screen/details_screen.dart';
import 'package:workout_hard/screens/home/home.dart';
import 'package:workout_hard/screens/splash_screen/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
  static const String detailsScreenRoute = "/detailsScreenRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routes.detailsScreenRoute:
        return MaterialPageRoute(builder: (context) => const DetailsScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteTitle),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
