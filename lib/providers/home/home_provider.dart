import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../views/home/services/home_services.dart';

class HomeProvider extends ChangeNotifier {
  //-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-FETCH CATEGORY PRODUCTS-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();
  fetchCategoryProducts(context, category) async {
    productList = (await homeServices.fetchCategoryProducts(
      context: context,
      category: category,
    ))
        .cast<Product>();
    notifyListeners();
  }

  //-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-DEAL OF THE DAY-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  Product? product;
  fetchDealOfDay(context) async {
    product = await homeServices.fetchDealOfDay(context: context);
    notifyListeners();
  }
}
