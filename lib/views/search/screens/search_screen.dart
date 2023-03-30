import 'package:e_shoppie/providers/search/search_provider.dart';
import 'package:e_shoppie/views/search/shimmer/search_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/serch_textform.dart';
import '../../../core/global_variables.dart';
import '../../product_details/screen/product_details.dart';
import '../widgets/searched_products.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchProvider>(context, listen: false)
          .fetchSearchedProduct(context, searchQuery);
    });
    void navigateToSearchScreen(String query) {
      Navigator.pushNamed(context, routeName, arguments: query);
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        backgroundColor: GlobalVariables.appBarColor,
        elevation: 0,
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
      body: Column(
        children: [
          SearchTextForm(onFieldSubmit: navigateToSearchScreen),
          Consumer<SearchProvider>(
            builder: (context, value, child) => value.products == null
                ? const SearchShimmer()
                : Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: value.products!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    ProductDetailScreen.routeName,
                                    arguments: value.products![index],
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: SearchedProduct(
                                    product: value.products![index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
