import 'package:e_shoppie/common/loader.dart';
import 'package:e_shoppie/views/account/widgets/single_product.dart';
import 'package:e_shoppie/views/admin/services/admin_services.dart';
import 'package:e_shoppie/views/order_details/screens/orderdetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/admin/orders_provider.dart';

class OrderedScreen extends StatefulWidget {
  const OrderedScreen({super.key});

  @override
  State<OrderedScreen> createState() => _OrderedScreenState();
}

class _OrderedScreenState extends State<OrderedScreen> {
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    Provider.of<AdminOrderProvider>(context, listen: false).getProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminOrderProvider>(
      builder: (context, orders, child) => orders.orders == null
          ? const Loader()
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
                    child: SingleProduct(
                      image: orderData.products[0].images[0],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
