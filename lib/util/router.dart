import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubiqmart/util/route_paths.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Login:
        return CupertinoPageRoute(builder: (_) => Login());
      default:
        {
          return CupertinoPageRoute(
              builder: (_) => Scaffold(
                    body: Center(
                      child: Text('No route defined for ${settings.name}'),
                    ),
                  ));
        }
    }
  }
}
