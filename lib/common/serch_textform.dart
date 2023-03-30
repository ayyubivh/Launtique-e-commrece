import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/global_variables.dart';
import 'package:flutter/material.dart';

class SearchTextForm extends StatelessWidget {
  final Function(String) onFieldSubmit;
  const SearchTextForm({super.key, required this.onFieldSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: GlobalVariables.appBarColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kwhite,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(7, 7),
                blurRadius: 10,
              ),
            ],
          ),
          child: TextFormField(
            onFieldSubmitted: onFieldSubmit,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(
                  left: 6,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 23,
                ),
              ),
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(top: 10),
              hintText: 'Search ',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
