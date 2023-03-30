import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/providers/product_details/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../../common/custom_button.dart';
import '../../../common/stars.dart';
import '../../../core/global_variables.dart';
import '../../../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-details';
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ProductDetailsProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.fetchRating(context, product);
    });

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        backgroundColor: GlobalVariables.appBarColor,
        title: const Text(
          'LAUNTIQUE',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.id!,
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: product.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.network(
                        i,
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width - 6,
                        // height: 100,
                      ),
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),
            kHeight10,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Text(
                product.name,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Text(product.description),
            ),
            Container(
              color: Colors.grey[100],
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Deal Price: ',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stars(
                    rating: provider.avgRating,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[100],
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                  text: 'Add to Cart',
                  onTap: () {
                    provider.addToCart(context, product);
                  },
                  color: Colors.blueGrey),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.grey[100],
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Rate The Product',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            RatingBar.builder(
              itemSize: 30,
              initialRating: provider.myRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: kblack,
              ),
              onRatingUpdate: (rating) {
                provider.rateProduct(context, rating, product);
              },
            )
          ],
        ),
      ),
    );
  }
}
