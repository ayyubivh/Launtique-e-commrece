import 'package:flutter/cupertino.dart';

import '../../../core/shimmer/shimmer.dart';

class CarousalShimmer extends StatelessWidget {
  const CarousalShimmer({super.key});

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
