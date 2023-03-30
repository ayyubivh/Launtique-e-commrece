import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/providers/home/home_provider.dart';
import 'package:e_shoppie/views/home/shimmer/category_deals.dart';
import 'package:e_shoppie/views/product_details/screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../../../core/global_variables.dart';
import '../../../models/product.dart';

class CategoryDealsScreen extends StatelessWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false)
          .fetchCategoryProducts(context, category);
    });
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        backgroundColor: GlobalVariables.appBarColor,
        elevation: 2,
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
      body: Consumer<HomeProvider>(
        builder: (context, value, child) => value.productList == null
            ? const CategoryDealsShimmer()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    kHeight10,
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Center(
                        child: Text(
                          'Keep shopping for $category',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MasonryGridView.count(
                        mainAxisSpacing: 15,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        itemCount: value.productList!.length,
                        itemBuilder: (context, index) {
                          final product = value.productList![index];
                          return singleItemWidget(
                              context,
                              product,
                              index == value.productList!.length - 1
                                  ? true
                                  : false);
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget singleItemWidget(BuildContext context, Product product, bool last) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ProductDetailScreen.routeName,
          arguments: product),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kwhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.5),
                    offset: const Offset(4, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.28),
                    child: Image.network(
                      product.images[0],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 10.0,
                    ),
                    child: Text(
                      product.name.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  kHeight5,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      height: 24,
                      color: GlobalVariables.appBarColor,
                      child: Text(
                        "\$ ${product.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
