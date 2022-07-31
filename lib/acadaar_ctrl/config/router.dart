import 'package:flutter/material.dart';
import 'package:zlga/acadaar_ctrl/constant/route_paths.dart';
import 'package:zlga/screen/Auth/AuthBottom.dart';
import 'package:zlga/screen/Flash/flashScreen.dart';
import 'package:zlga/screen/Home/HomeIndexScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/welcome':
        return MaterialPageRoute(builder: (_) => ScreenFlash());
      case '${RoutePaths.loginBottom}':
        return MaterialPageRoute(builder: (_) => AuthBottomController());
      case '${RoutePaths.home}':
        return MaterialPageRoute(builder: (_) => RootBottom());
      case '${RoutePaths.driverHome}':
        return MaterialPageRoute(builder: (_) => AuthBottomController());
      case '${RoutePaths.purchaseSuccess}':
        return MaterialPageRoute(builder: (_) => AuthBottomController());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
