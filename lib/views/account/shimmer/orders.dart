import 'package:flutter/material.dart';

import '../../../core/shimmer/shimmer.dart';

class OrdersShimmer extends StatelessWidget {
  const OrdersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            const ShimmerWidget.borderRectangle(
              height: 85,
              width: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangle(
                  height: 10,
                  width: 80,
                  radius: BorderRadius.circular(20),
                ),
                ShimmerWidget.rectangle(
                  height: 10,
                  width: 50,
                  radius: BorderRadius.circular(20),
                ),
                ShimmerWidget.rectangle(
                  height: 10,
                  width: 50,
                  radius: BorderRadius.circular(20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
