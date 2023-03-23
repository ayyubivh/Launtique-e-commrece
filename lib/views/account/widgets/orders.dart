import 'package:e_shoppie/common/loader.dart';
import 'package:e_shoppie/providers/account/orders_provider.dart';
import 'package:e_shoppie/views/account/services/account_service.dart';
import 'package:e_shoppie/views/account/widgets/order_view.dart';
import 'package:e_shoppie/views/order_details/screens/orderdetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/global_variables.dart';
import '../../../models/orders.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).fetchOrders(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, value, child) => value.orders == null
          ? const Loader()
          : Column(
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
                          image:
                              value.orders![reverseIndex].products[0].images[0],
                          name: value.orders![reverseIndex].products[0].name,
                          price: value.orders![reverseIndex].products[0].price),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
