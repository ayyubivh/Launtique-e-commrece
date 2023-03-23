import 'package:e_shoppie/models/orders.dart';
import 'package:e_shoppie/views/account/services/account_service.dart';
import 'package:flutter/material.dart';

import '../../views/admin/services/admin_services.dart';

class OrderProvider extends ChangeNotifier {
  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-FETCH PRODUCTS-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\\

  List<Order>? orders;
  Order? getorder;
  bool isLoading = false;
  void fetchOrders(context) async {
    orders = await AccountServices().fetchMyOrders(context: context);
    notifyListeners();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=ORDER VIEW-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  int sts = 0;
  final AdminServices adminServices = AdminServices();

  // void changeOrderStatus(context, order) {
  //   adminServices.changeOrderStatus(
  //     context: context,
  //     order: order,
  //     status: sts,
  //     onSuccess: () {
  //       notifyListeners();
  //     },
  //   );
  // }
  //========only for admin======\\

  int currentStep = 0;
  void changeOrderStatus(int status, order, context) {
    adminServices.changeOrderStatus(
      context: context,
      order: order,
      status: sts,
      onSuccess: () {
        currentStep += 1;
        notifyListeners();
      },
    );
    notifyListeners();
  }

  List status = [
    'Pending',
    'Completed',
    'Receiced',
    'Deliverd',
  ];
}
