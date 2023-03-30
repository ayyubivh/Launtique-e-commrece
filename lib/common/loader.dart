import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/global_variables.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: kwhite,
        backgroundColor: GlobalVariables.primaryColor,
      ),
    );
  }
}
