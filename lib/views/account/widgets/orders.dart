import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/providers/account/orders_provider.dart';
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
                  kHeight5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15),
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
                  kHeight15,
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueGrey.withOpacity(0.5),
                                    offset: const Offset(4, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: OrderView(
                                  order: value.orders![reverseIndex],
                                  image: value.orders![reverseIndex].products[0]
                                      .images[0],
                                  name: value
                                      .orders![reverseIndex].products[0].name,
                                  price: value
                                      .orders![reverseIndex].products[0].price),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
