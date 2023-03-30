import 'package:e_shoppie/views/account/widgets/single_product.dart';
import 'package:e_shoppie/views/admin/shimmer/order_scrn_shimmer.dart';
import 'package:e_shoppie/views/order_details/screens/orderdetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/admin/orders_provider.dart';

class OrderedScreen extends StatelessWidget {
  const OrderedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AdminOrderProvider>(context, listen: false)
          .getProduct(context);
    });
    return Consumer<AdminOrderProvider>(
      builder: (context, orders, child) => orders.orders == null
          ? const OrderScreenShimmer()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
              itemCount: orders.orders!.length,
              itemBuilder: (context, index) {
                final orderData = orders.orders![index];
                return SizedBox(
                  height: 140,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, OrderDetailsScreen.routeName,
                          arguments: orderData);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleProduct(
                        image: orderData.products[0].images[0],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
