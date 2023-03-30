import 'package:flutter/material.dart';

import '../../../core/shimmer/shimmer.dart';

class AnalyticsShimmer extends StatelessWidget {
  const AnalyticsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ShimmerWidget.rectangle(
        height: 250,
        width: double.infinity,
        radius: BorderRadius.circular(20),
      ),
    );
  }
}
