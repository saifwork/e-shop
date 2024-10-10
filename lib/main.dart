import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/auth_provider.dart';
import 'package:shop/provider/product_provider.dart';
import 'package:shop/utils/router.dart';
import 'firebase_options.dart';
import 'provider/theme_provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'E SHOP',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: CustomRouter.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}