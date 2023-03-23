import 'package:e_shoppie/core/colors.dart';
import 'package:flutter/material.dart';
import '../../../core/global_variables.dart';
import '../screens/category_deals.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToCategoryPage(
              context,
              GlobalVariables.categoryImages[index]['title']!,
            ),
            child: Container(
              height: 170,
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 4),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            GlobalVariables.categoryImages[index]['image']!,
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 10,
                    child: Text(
                      "${GlobalVariables.categoryImages[index]['title']}",
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato',
                          letterSpacing: 1),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
