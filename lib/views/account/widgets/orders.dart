import 'package:e_shoppie/common/loader.dart';
import 'package:e_shoppie/providers/account/orders_provider.dart';
import 'package:e_shoppie/views/account/services/account_service.dart';
import 'package:e_shoppie/views/account/shimmer/orders.dart';
import 'package:e_shoppie/views/account/widgets/order_view.dart';
import 'package:e_shoppie/views/order_details/screens/orderdetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/global_variables.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderProvider>(context, listen: false).fetchOrders(context);
    });

    return Consumer<OrderProvider>(
      builder: (context, value, child) => value.orders == null
          ? const OrdersShimmer()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: const Text(
                          'Your Orders',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 15,
                        ),
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: GlobalVariables.selectedNavBarColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.orders!.length,
                    itemBuilder: (context, index) {
                      int reverseIndex = value.orders!.length - index - 1;
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            OrderDetailsScreen.routeName,
                            arguments: value.orders![reverseIndex],
                          );
                        },
                        child: OrderView(
                            order: value.orders![reverseIndex],
                            image: value
                                .orders![reverseIndex].products[0].images[0],
                            name: value.orders![reverseIndex].products[0].name,
                            price:
                                value.orders![reverseIndex].products[0].price),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
