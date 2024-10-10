import 'package:flutter/material.dart';
import 'package:shop/data/models/product/get_all_products.dart';
import 'package:shop/views/product/product_screen.dart';
import 'package:shop/views/splash_screen.dart';
import '../views/auth_screen.dart';
import '../views/home/home_screen.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/product':
        final ProductElement product = settings.arguments as ProductElement;
        return MaterialPageRoute(
          builder: (_) => ProductScreen(product: product),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Refresh The Page ${settings.name}'),
            ),
          ),
        );
    }
  }
}
