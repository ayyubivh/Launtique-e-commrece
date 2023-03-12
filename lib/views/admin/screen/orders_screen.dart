import 'package:e_shoppie/common/loader.dart';
import 'package:e_shoppie/views/account/widgets/single_product.dart';
import 'package:e_shoppie/views/admin/services/admin_services.dart';
import 'package:e_shoppie/views/order_details/screens/orderdetails.dart';
import 'package:flutter/material.dart';

import '../../../models/orders.dart';

class OrderedScreen extends StatefulWidget {
  const OrderedScreen({super.key});

  @override
  State<OrderedScreen> createState() => _OrderedScreenState();
}

class _OrderedScreenState extends State<OrderedScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: orders!.length,
            itemBuilder: (context, index) {
              final orderData = orders![index];
              return SizedBox(
                height: 140,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, OrderDetailsScreen.routeName,
                        arguments: orderData);
                  },
                  child: SingleProduct(
                    image: orderData.products[0].images[0],
                  ),
                ),
              );
            },
          );
  }
}
