import 'package:e_shoppie/common/custom_button.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/models/orders.dart';
import 'package:e_shoppie/providers/account/orders_provider.dart';
import 'package:e_shoppie/providers/user_provider.dart';
import 'package:e_shoppie/views/admin/services/admin_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../core/global_variables.dart';
import '../../search/screens/search_screen.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String routeName = '/order-details';
  final Order order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final AdminServices adminScreen = AdminServices();
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false).currentStep =
        widget.order.status;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.appBarColor,
        title: const Text(
          'LAUNTIQUE',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blueGrey),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kHeight10,
            const Text(
              'View Order details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Date:      ${DateFormat().format(
                    DateTime.fromMillisecondsSinceEpoch(widget.order.orderedAt),
                  )}'),
                  Text('Order ID:          ${widget.order.id}'),
                  Text('Order Total:      \$${widget.order.totalPrice}'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Purchase Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < widget.order.products.length; i++)
                    Row(
                      children: [
                        Image.network(
                          widget.order.products[i].images[0],
                          height: 120,
                          width: 120,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.order.products[i].name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Qty: ${widget.order.quantity[i]}',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tracking',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Consumer<OrderProvider>(
                builder: (context, value, child) => Stepper(
                  currentStep: value.currentStep,
                  controlsBuilder: (context, details) {
                    if (user.type == 'admin') {
                      return CustomButton(
                        text: 'Done',
                        onTap: () {
                          value.changeOrderStatus(
                              details.currentStep, widget.order, context);
                        },
                      );
                    }
                    return const SizedBox();
                  },
                  steps: [
                    Step(
                      isActive: value.currentStep >= 0,
                      state: value.currentStep >= 0
                          ? StepState.complete
                          : StepState.indexed,
                      title: const Text('Pending'),
                      content: const Text(
                        'Your order is yet to be delivered',
                      ),
                    ),
                    Step(
                      isActive: value.currentStep >= 1,
                      state: value.currentStep >= 1
                          ? StepState.complete
                          : StepState.indexed,
                      title: const Text('Completed'),
                      content: const Text(
                        'Your order has been delivered, you are yet to sign.',
                      ),
                    ),
                    Step(
                      isActive: value.currentStep >= 2,
                      state: value.currentStep >= 2
                          ? StepState.complete
                          : StepState.indexed,
                      title: const Text('Received'),
                      content: const Text(
                        'Your order has been delivered, you are yet to sign.',
                      ),
                    ),
                    Step(
                      isActive: value.currentStep >= 3,
                      state: value.currentStep >= 3
                          ? StepState.complete
                          : StepState.indexed,
                      title: const Text('Delivered'),
                      content: const Text(
                        'Your order has bee n delivered, you are yet to sign.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
