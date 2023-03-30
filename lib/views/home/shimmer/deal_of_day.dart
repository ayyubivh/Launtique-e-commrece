import 'package:flutter/material.dart';

import '../../../core/shimmer/shimmer.dart';

class DealOfDayShimmer extends StatelessWidget {
  const DealOfDayShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.rectangle(
            height: 200,
            width: double.infinity,
            radius: BorderRadius.circular(20),
          ),
          ShimmerWidget.rectangle(
            height: 15,
            width: 60,
            radius: BorderRadius.circular(20),
          ),
          ShimmerWidget.rectangle(
            height: 15,
            width: 80,
            radius: BorderRadius.circular(20),
          ),
          Center(
            child: ShimmerWidget.rectangle(
              height: 70,
              width: 85,
              radius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
