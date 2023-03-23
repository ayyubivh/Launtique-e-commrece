import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../views/search/services/search_Services.dart';

class SearchProvider extends ChangeNotifier {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  fetchSearchedProduct(context, searchQuery) async {
    products = (await searchServices.fetchSearchedProduct(
            context: context, searchQuery: searchQuery))
        .cast<Product>();
    notifyListeners();
  }
}
