import 'package:flutter/material.dart';
import 'package:mvvm_provider_app/utils/route/routes_name.dart';

import 'package:mvvm_provider_app/view/home_screen.dart';
import 'package:mvvm_provider_app/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("Routes Not Defined"),
            ),
          );
        });
    }
  }
}
