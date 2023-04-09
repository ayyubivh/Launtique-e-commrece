import 'package:e_shoppie/core/colors.dart';
import 'package:flutter/material.dart';

class SearchTextForm extends StatelessWidget {
  final Function(String) onFieldSubmit;
  const SearchTextForm({super.key, required this.onFieldSubmit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kwhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(-5, -5),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(10, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: TextFormField(
          onFieldSubmitted: onFieldSubmit,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: 6,
              ),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 23,
              ),
            ),
            hintText: 'Search ',
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
