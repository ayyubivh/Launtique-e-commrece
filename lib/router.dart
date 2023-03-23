import 'package:e_shoppie/common/bottom_bar.dart';
import 'package:e_shoppie/models/orders.dart';
import 'package:e_shoppie/models/product.dart';
import 'package:e_shoppie/views/address/screens/address_screen.dart';
import 'package:e_shoppie/views/auth/screens/auth_screen.dart';
import 'package:e_shoppie/views/home/screens/category_deals.dart';
import 'package:e_shoppie/views/home/screens/home_screen.dart';
import 'package:e_shoppie/views/order_details/screens/orderdetails.dart';
import 'package:e_shoppie/views/product_details/screen/product_details.dart';
import 'package:e_shoppie/views/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'views/admin/screen/add_product_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddProductScreen(),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryDealsScreen(
                category: category,
              ));
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchScreen(
                searchQuery: searchQuery,
              ));
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    case Addrresscreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Addrresscreen(totalAmount: totalAmount),
      );
    case OrderDetailsScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailsScreen(order: order),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist!'),
                ),
              ));
  }
}
