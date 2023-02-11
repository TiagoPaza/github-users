import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_users/app/di.dart';
import 'package:github_users/presentation/home/home_view.dart';
import 'package:github_users/presentation/resources/strings_manager.dart';
import 'package:github_users/presentation/splash/splash_view.dart';
import 'package:github_users/presentation/user_details/user_details_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
  static const String userDetailsRoute = "/userDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments as Map?;

    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.homeRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.userDetailsRoute:
        initUserDetailsModule();
        if (args != null) {
          return MaterialPageRoute(
            builder: (_) => UserDetailsView(
              userDetailResponse: args['userDetailResponse'],
            ),
          );
        }
        return unDefinedRoute();
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound).tr(),
        ),
        body: Center(child: Text(AppStrings.noRouteFound).tr()),
      ),
    );
  }
}
