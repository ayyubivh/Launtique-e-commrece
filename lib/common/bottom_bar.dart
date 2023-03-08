import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 28,
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarwidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: bottomBarBorderWidth,
                              color: _page == 0
                                  ? GlobalVariables.selectedNavBarColor
                                  : GlobalVariables.backgroundColor))),
                  child: const Icon(Icons.home),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarwidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: bottomBarBorderWidth,
                              color: _page == 1
                                  ? GlobalVariables.selectedNavBarColor
                                  : GlobalVariables.backgroundColor))),
                  child: const Icon(Icons.person),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarwidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: bottomBarBorderWidth,
                              color: _page == 2
                                  ? GlobalVariables.selectedNavBarColor
                                  : GlobalVariables.backgroundColor))),
                  child: badges.Badge(
                    badgeStyle: const BadgeStyle(
                      badgeColor: Colors.white,
                      elevation: 0,
                    ),
                    badgeContent: Text(userCartLen.toString()),
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
                ),
                label: '')
          ],
        ));
  }
}
