import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget.rectangle(
      {super.key,
      this.width = double.infinity - 70,
      required this.height,
      this.shapeBorder = const RoundedRectangleBorder(),
      required BorderRadius radius});
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
