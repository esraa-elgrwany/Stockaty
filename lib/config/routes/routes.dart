import 'package:flutter/material.dart';
import 'package:my_shopping_app/features/Cart/presentation/pages/cart_screen.dart';
import 'package:my_shopping_app/features/SignUp/presentation/pages/signup_screen.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';
import 'package:my_shopping_app/features/home/presentation/Tabs/Fav_Tab.dart';

import 'package:my_shopping_app/features/home/presentation/pages/home_screen.dart';

import 'package:my_shopping_app/features/login/presentation/pages/login_screen.dart';

import '../../features/ProductDetails/presentation/pages/product_details.dart';


class RoutesName {
  static const String login = "/";
  static const String signup = "signup";
  static const String home = "home";
  static const String productDetails = "productDetails";
  static const String cart = "cartScreen";
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
      case RoutesName.cart:
        return MaterialPageRoute(
          builder: (context) => CartScreen(),
        );
      case RoutesName.productDetails:
        ProductData productData =
        settings.arguments as ProductData;
        return MaterialPageRoute(
          builder: (context) => ProductDetails(productData),
        );
        default:
          return MaterialPageRoute(
            builder: (context) => UnDefineScreen(),
          );
    }
  }
  static Widget UnDefineScreen(){
    return Scaffold(
      appBar: AppBar(
          title: Text("Undefine page"),
      ),
      body: Center(
        child: Text("Page not found"),
      ),
    );
  }
}
