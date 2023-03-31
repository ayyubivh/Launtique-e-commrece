import 'package:e_shoppie/core/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ShimmerWidget.rectangle(
            height: 100, radius: BorderRadius.circular(20));
      },
    );
  }
}
