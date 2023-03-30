import 'package:flutter/material.dart';

import '../../../core/shimmer/shimmer.dart';

class SearchShimmer extends StatelessWidget {
  const SearchShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(top: 8),
        child: Row(
          children: [
            ShimmerWidget.rectangle(
              height: 125,
              width: 100,
              radius: BorderRadius.circular(20),
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
                  height: 8,
                  width: 50,
                  radius: BorderRadius.circular(20),
                ),
                ShimmerWidget.rectangle(
                  height: 10,
                  width: 80,
                  radius: BorderRadius.circular(20),
                ),
                ShimmerWidget.rectangle(
                  height: 8,
                  width: 40,
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
