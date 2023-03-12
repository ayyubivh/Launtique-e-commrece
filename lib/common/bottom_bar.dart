import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/views/cart/screens/cart_screens.dart';
import 'package:e_shoppie/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views/account/screens/account_screen.dart';
import '../views/home/screens/home_screen.dart';
import '../core/global_variables.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen()
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
        body: pages[_page],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(9.9),
          child: Container(
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.black.withOpacity(0.8),
            ),
            child: BottomNavigationBar(
              currentIndex: _page,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.transparent,
              iconSize: 28,
              onTap: updatePage,
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: ''),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: ''),
                BottomNavigationBarItem(
                    icon: badges.Badge(
                      badgeStyle: const BadgeStyle(
                        badgeColor: Colors.orangeAccent,
                        elevation: 0,
                      ),
                      badgeContent: Text(userCartLen.toString()),
                      child: const Icon(Icons.shopping_cart_outlined),
                    ),
                    label: '')
              ],
            ),
          ),
        ));
  }
}
