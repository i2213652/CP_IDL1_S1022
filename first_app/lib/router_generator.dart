import 'package:first_app/products/models/product_model.dart';
import 'package:flutter/material.dart';

import 'package:first_app/products/pages/cart_page.dart';
import 'package:first_app/products/pages/home_page.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/cart':
        if (arguments is List<ProductModel>) {
          return MaterialPageRoute(
              builder: (_) => CartPage(products: arguments));
        } else {
          return _errorRoute();
        }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
