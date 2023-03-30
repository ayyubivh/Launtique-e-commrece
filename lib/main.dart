import 'package:e_shoppie/providers/account/orders_provider.dart';
import 'package:e_shoppie/providers/admin/admin_provider.dart';
import 'package:e_shoppie/providers/auth/auth_provider.dart';
import 'package:e_shoppie/providers/bottombar/bottom_bar_provider.dart';
import 'package:e_shoppie/providers/home/home_provider.dart';
import 'package:e_shoppie/providers/introprovider/splash_provider.dart';
import 'package:e_shoppie/providers/product_details/product_details_provider.dart';
import 'package:e_shoppie/providers/search/search_provider.dart';
import 'package:e_shoppie/providers/user_provider.dart';
import 'package:e_shoppie/router.dart';
import 'package:e_shoppie/views/intro_pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/admin/orders_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => OrderProvider()),
    ChangeNotifierProvider(create: (context) => AdminProvider()),
    ChangeNotifierProvider(create: (context) => AdminOrderProvider()),
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    ChangeNotifierProvider(create: (context) => SearchProvider()),
    ChangeNotifierProvider(create: (context) => BottomBarProvider()),
    ChangeNotifierProvider(create: (context) => SplashProvider()),
    ChangeNotifierProvider(create: (context) => ProductDetailsProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const SplashScreen(),
    );
  }
}
