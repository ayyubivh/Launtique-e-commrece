import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/core/utils.dart';
import 'package:e_shoppie/views/home/widgets/top_container.dart';
import 'package:flutter/material.dart';
import '../widgets/carousel_images.dart';
import '../widgets/deal_of_day.dart';
import '../widgets/top_categories.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TopContainer(),
            kHeight15,
            CarouselImage(),
            kHeight5,
            // CustomDivider(),
            kHeight5,
            Categories(),
            kHeight5,
            // CustomDivider(),
            // CustomButton(
            //   text: 'sample',
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => AllProducts(),
            //     ));
            //   },
            // ),
            DealOfDay(),
            // AllProducts()
          ],
        ),
      ),
    );
  }
}
