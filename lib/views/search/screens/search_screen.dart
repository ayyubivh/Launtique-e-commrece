import 'package:e_shoppie/providers/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/loader.dart';
import '../../../common/serch_textform.dart';
import '../../../core/global_variables.dart';
import '../../home/widgets/addres_box.dart';
import '../../product_details/screen/product_details.dart';
import '../widgets/searched_products.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SearchProvider>(context, listen: false)
        .fetchSearchedProduct(context, widget.searchQuery);
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
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
                ? const Loader()
                : Expanded(
                    child: Column(
                      children: [
                        const AddressBox(),
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
                                child: SearchedProduct(
                                  product: value.products![index],
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
