import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/utils.dart';
import '../../models/product.dart';
import '../../views/admin/models/sales.dart';
import '../../views/admin/screen/analytic_screen.dart';
import '../../views/admin/screen/orders_screen.dart';
import '../../views/admin/screen/posts_screen.dart';
import '../../views/admin/services/admin_services.dart';

class AdminProvider extends ChangeNotifier {
  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=TEXT EDITING CONTROLLER=-=-=-=-=-=-=-=-=-=-=-=-=-=-\\

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=FORM KEYS=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  final addProductFormKey = GlobalKey<FormState>();

  final AdminServices adminServices = AdminServices();

  List<File> images = [];
  String category = 'MENS';
  List<String> productCategories = [
    'MENS',
    'WOMENS',
    'KIDS',
    'SHOES',
    'ACCESSORIES'
  ];
//=-=-=-=-=-=-=-=-=-=-==-=-=-=-PAGES-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\\
  int currenIndex = 0;
  List<Widget> pages = [
    const PostsScreen(),
    const AnalyticsScreen(),
    const OrderedScreen(),
  ];
  updatePage(page) {
    notifyListeners();
    currenIndex = page;
    notifyListeners();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=SELECT IMAGE=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  selectImages() async {
    var res = await pickImage();
    images = res;
    notifyListeners();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=CATEGORY DROPDOWN=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  categoryDropdown(String? newVal) {
    category = newVal!;
    notifyListeners();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=CLEAR=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  void clear() {
    productNameController.clear();
    descriptionController.clear();
    priceController.clear();
    quantityController.clear();
    images.clear();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=SELL PRODUCTS=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  bool isLoading = false;
  void sellProduct(context) {
    if (addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
      );
      notifyListeners();
      isLoading = true;
    }
    clear();
    notifyListeners();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=FETCH ALL PRODUCTS=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  List<Product>? products;
  fetchAllProducts(context) async {
    products = await adminServices.fetchAllProducts(context);
    notifyListeners();
  }

  void deleteProduct(Product product, int index, context) {
    adminServices.deletProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
      },
    );
    notifyListeners();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=GET EARNINGS-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  int? totalSales;
  List<Sales>? earnings;
  void getEarnings(context) async {
    var earningData = await adminServices.getEarnings(context);

    totalSales = earningData['totalEarnings'];

    earnings = earningData['sales'];
    notifyListeners();
  }
}
