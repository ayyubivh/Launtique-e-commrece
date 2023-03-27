import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// loadingShimmer() {
//   return const ListTile(
//     leading: ShimmerWidget.borderRectangle(width: 100, height: 100),
//     title: ShimmerWidget.rectangular(height: 70),
//   );
// }

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget.rectangular(
      {super.key,
      this.width = double.infinity - 70,
      required this.height,
      this.shapeBorder = const RoundedRectangleBorder()});
  const ShimmerWidget(
      {super.key, required this.width, required this.height, this.shapeBorder});
  const ShimmerWidget.borderRectangle({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  });

  final double width;
  final double height;
  final ShapeBorder? shapeBorder;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: shapeBorder!,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
