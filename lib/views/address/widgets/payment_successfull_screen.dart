import 'package:e_shoppie/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:e_shoppie/common/bottom_bar.dart';
import '../../../core/colors.dart';

class PaymentSuccess extends StatelessWidget {
  static const routeName = "/payment-success";
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              'assets/images/succes_img.gif',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0).copyWith(
              top: 100,
            ),
            child: CustomButton(
              color: Colors.green,
              text: 'OK',
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  BottomBar.routeName,
                  (route) => false,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
