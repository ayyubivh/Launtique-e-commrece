import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils.dart';
import '../../views/product_details/services/product_details_service.dart';
import '../user_provider.dart';

class ProductDetailsProvider extends ChangeNotifier {
  // Product? product;

  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  double avgRating = 0;
  double myRating = 0;
  fetchRating(context, product) {
    double totalRating = 0;
    for (int i = 0; i < product!.rating!.length; i++) {
      totalRating += product!.rating![i].rating;
      if (product!.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = product!.rating![i].rating;
      }
    }
    notifyListeners();

    if (totalRating != 0) {
      avgRating = totalRating / product!.rating!.length;
    }
    notifyListeners();
  }

  addToCart(context, product) {
    productDetailsServices.addToCart(
      context: context,
      product: product,
    );
    showSnackBar(context, 'Product added to cart');
    notifyListeners();
  }

  rateProduct(context, rating, product) {
    productDetailsServices.rateProduct(
      context: context,
      product: product,
      rating: rating,
    );
    notifyListeners();
  }
}
