import 'package:e_shoppie/core/colors.dart';
import 'package:flutter/material.dart';
import '../../../core/global_variables.dart';
import '../screens/category_deals.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

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
          return InkWell(
            onTap: () => navigateToCategoryPage(
              context,
              GlobalVariables.categoryImages[index]['title']!,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.0),
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.5),
                      offset: const Offset(8, 8),
                      blurRadius: 5,
                    ),
                  ],
                ),
                height: 170,
                // padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 19),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
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
            ),
          );
        },
      ),
    );
  }
}
