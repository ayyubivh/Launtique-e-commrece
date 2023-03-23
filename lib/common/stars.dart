import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../core/global_variables.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemPadding: EdgeInsets.only(right: 5),
      direction: Axis.horizontal,
      itemCount: 5,
      rating: rating,
      itemSize: 15,
      itemBuilder: (BuildContext context, int index) {
        return const Icon(
          Icons.star,
          color: GlobalVariables.secondaryColor,
        );
      },
    );
  }
}
