import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/shimmer/shimmer.dart';

class CategoryDealsShimmer extends StatelessWidget {
  const CategoryDealsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      mainAxisSpacing: 15,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      itemCount: 10,
      itemBuilder: (context, index) => ShimmerWidget.rectangle(
        height: 220,
        width: 100,
        radius: BorderRadius.circular(20),
      ),
    );
  }
}
