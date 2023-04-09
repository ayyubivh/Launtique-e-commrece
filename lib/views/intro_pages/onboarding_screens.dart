import 'package:e_shoppie/common/custom_button.dart';
import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/global_variables.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/views/auth/screens/auth_screen.dart';
import 'package:e_shoppie/views/intro_pages/widgets/image_listview.dart';
import 'package:e_shoppie/views/intro_pages/widgets/indicators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/onboard_page.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/intro-page";
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: const [
                ImageListView(startIndex: 0),
                ImageListView(startIndex: 1),
                ImageListView(startIndex: 2),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.80,
            child: const Text(
              'data',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.60,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.white60,
                  Colors.white,
                  Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.center,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Appearance \n Shows Your Quality',
                    style: TextStyle(
                        fontSize: 27,
                        color: kblack,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lato'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Change Quality of  Your \n Appearance with Launtique',
                    style: TextStyle(
                        fontSize: 27,
                        color: kblack,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lato'),
                    textAlign: TextAlign.center,
                  ),
                  kHeight15,
                  kHeight15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ...buildIndicators(),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: CustomButton(
                color: GlobalVariables.primaryColor,
                text: 'NEXT',
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IntroductionSliders(),
                      ));
                },
              ))
        ],
      ),
    );
  }
}
