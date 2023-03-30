import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/models/orders.dart';
import 'package:e_shoppie/providers/account/orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/sizedboxes.dart';

class OrderView extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final Order order;
  const OrderView({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  void initState() {
    super.initState();
    sts = widget.order.status;
  }

  int sts = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kwhite,
          ),
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            top: 3,
            left: 5,
            bottom: 4,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                  height: 95,
                  width: 90,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ),
                  // kHeight15,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          '\$${widget.price}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: kblack.withOpacity(0.5),
                      )
                    ],
                  ),
                  kHeight10,
                  Consumer<OrderProvider>(
                    builder: (context, value, child) => Container(
                      width: 200,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        value.status[sts],
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(5.0),
        //   child: Container(
        //     height: 4,
        //     color: Colors.grey[200],
        //   ),
        // )
      ],
    );
  }
}
