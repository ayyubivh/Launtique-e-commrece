import 'package:e_shoppie/core/global_variables.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:flutter/material.dart';
import '../../../common/serch_textform.dart';
import '../../../core/colors.dart';
import '../../search/screens/search_screen.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToSearchScreen(String query) {
      Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        Container(
          decoration: BoxDecoration(
            color: GlobalVariables.primaryColor.withOpacity(0.5),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(4, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight15,
                    kHeight10,
                    kHeight15,
                    kHeight5,
                    RichText(
                      text: TextSpan(
                          text: 'Find your \n',
                          style: TextStyle(
                            fontSize: 22,
                            color: kblack,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Lato',
                          ),
                          children: [
                            TextSpan(
                              text: 'New Collection',
                              style: TextStyle(
                                color: kblack,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ]),
                    ),
                    kHeight15,
                    SearchTextForm(onFieldSubmit: navigateToSearchScreen),
                    kHeight15,
                    kHeight15,
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
