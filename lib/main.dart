import 'package:e_shoppie/common/bottom_bar.dart';
import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/providers/account/orders_provider.dart';
import 'package:e_shoppie/providers/admin/admin_provider.dart';
import 'package:e_shoppie/providers/auth/auth_provider.dart';
import 'package:e_shoppie/providers/home/home_provider.dart';
import 'package:e_shoppie/providers/search/search_provider.dart';
import 'package:e_shoppie/views/auth/screens/auth_screen.dart';
import 'package:e_shoppie/views/auth/services/auth_service.dart';
import 'package:e_shoppie/providers/user_provider.dart';
import 'package:e_shoppie/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/admin/orders_provider.dart';
import 'views/admin/screen/admin_sceeen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => OrderProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AdminProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AdminOrderProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SearchProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E - shoppe',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
      // home: const IntroScreen(),
    );
  }
}
