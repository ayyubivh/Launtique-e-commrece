import 'package:flutter/material.dart';

import '../../../core/shimmer/shimmer.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 200,
            width: 350,
            child: ShimmerWidget.rectangle(
              height: 100,
              width: 100,
              radius: BorderRadius.circular(20),
            )));
  }
}
