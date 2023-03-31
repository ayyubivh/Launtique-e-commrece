import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:e_shoppie/common/nointernet.dart';
import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/providers/bottombar/bottom_bar_provider.dart';
import 'package:e_shoppie/providers/network/network_provider.dart';
import 'package:e_shoppie/views/cart/screens/cart_screens.dart';
import 'package:e_shoppie/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views/account/screens/account_screen.dart';
import '../views/home/screens/home_screen.dart';

class BottomBar extends StatelessWidget {
  static const String routeName = '/actual-home';
  BottomBar({super.key});

  double bottomBarwidth = 42;

  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Consumer2<BottomBarProvider, NetworkStatus>(
      builder: (context, value, network, child) => Scaffold(
          body: network == NetworkStatus.online
              ? pages[value.page]
              : const Connectionfailed(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.page,
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: Colors.grey,
            iconSize: 28,
            onTap: value.updatePage,
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: ''),
              BottomNavigationBarItem(
                  icon: badges.Badge(
                    badgeStyle: const BadgeStyle(
                      badgeColor: Colors.red,
                      elevation: 0,
                    ),
                    badgeContent: Text(
                      userCartLen.toString(),
                      style: TextStyle(color: kwhite),
                    ),
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
                  label: '')
            ],
          )),
    );
  }
}
