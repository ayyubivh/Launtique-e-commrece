import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/global_variables.dart';
import 'package:flutter/material.dart';

class SearchTextForm extends StatelessWidget {
  final Function(String) onFieldSubmit;
  const SearchTextForm({super.key, required this.onFieldSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: Colors.black.withOpacity(0.3),
                offset: Offset(7, 7),
                blurRadius: 10,
              ),
            ],
          ),
          child: TextFormField(
            onFieldSubmitted: onFieldSubmit,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 6,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 23,
                  ),
                ),
              ),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
              // border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(30),
              //     borderSide: BorderSide(
              //       color: Colors.amber,
              //       width: 3,
              //     )),
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
