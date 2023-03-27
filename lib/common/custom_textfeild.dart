import 'package:e_shoppie/core/global_variables.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Widget? suffix;
  final String hinTtext;
  final int maxlines;
  final bool? pstext;
  const CustomTextField({
    super.key,
    this.text = '',
    required this.controller,
    this.hinTtext = '',
    this.maxlines = 1,
    this.suffix,
    this.pstext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: GlobalVariables.primaryColor),
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
          ),
          hintText: hinTtext,
          suffixIcon: suffix,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: GlobalVariables.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: GlobalVariables.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(15)),
        ),
        obscureText: pstext ?? false,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your $hinTtext';
          }
          return null;
        },
        maxLines: maxlines,
      ),
    );
  }
}
