import 'package:flutter/material.dart';

import '../../../core/shimmer/shimmer.dart';

class OrderScreenShimmer extends StatelessWidget {
  const OrderScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 10,
      itemBuilder: (context, index) => Center(
        child: ShimmerWidget.rectangle(
          height: 180,
          // width: 100,
          radius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
