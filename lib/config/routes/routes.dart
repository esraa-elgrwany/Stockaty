import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shopping_app/features/SignUp/presentation/pages/signup_screen.dart';
import 'package:my_shopping_app/features/home/presentation/pages/home_screen.dart';

import 'package:my_shopping_app/features/login/presentation/pages/login_screen.dart';


class RoutesName {
  static const String login = "/";
  static const String signup = "signup";
  static const String home = "home";
}

class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
        default:
          return MaterialPageRoute(
            builder: (context) => UnDefinedScreen(),
          );
    }
  }
  static Widget UnDefinedScreen(){
    return Scaffold(
      appBar: AppBar(
          title: Text("Undefined page"),
      ),
      body: Center(
        child: Text("Page not found"),
      ),
    );
  }
}
