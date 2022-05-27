import 'package:barcodeapp/screens/authentication/authentication_page.dart';
import 'package:barcodeapp/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return _pages(const HomePage());
      case '/signup':
        return _pages(SignUpPage());
      default:
    }
  }

  _pages(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
