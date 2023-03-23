import 'package:e_shoppie/views/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

import '../../models/orders.dart';

class AdminOrderProvider extends ChangeNotifier {
  List<Order>? orders;
  void getProduct(context) async {
    await AdminServices().fetchAllOrders(context).then((value) {
      if (value != null) {
        orders = value;
        notifyListeners();
      } else {
        notifyListeners();
      }
    });
  }
}
