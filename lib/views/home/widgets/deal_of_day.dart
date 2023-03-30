import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/providers/home/home_provider.dart';
import 'package:e_shoppie/views/home/shimmer/deal_of_day.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../product_details/screen/product_details.dart';

class DealOfDay extends StatelessWidget {
  const DealOfDay({Key? key}) : super(key: key);

  // @override

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).fetchDealOfDay(context);
    });
    void navigateToDetailScreen() {
      Navigator.pushNamed(
        context,
        ProductDetailScreen.routeName,
        arguments: Provider.of<HomeProvider>(context, listen: false).product,
      );
    }

    return Consumer<HomeProvider>(
      builder: (context, value, child) => value.product == null
          ? const DealOfDayShimmer()
          : value.product!.name.isEmpty
              ? const SizedBox()
              : GestureDetector(
                  onTap: navigateToDetailScreen,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade200, width: 5),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: const Text(
                              'Top Trending',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          kHeight10,
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 1.2,
                          //   height: 205,
                          //   decoration: BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: Colors.blueGrey.withOpacity(0.5),
                          //         offset: const Offset(4, 4),
                          //         blurRadius: 10,
                          //       ),
                          //     ],
                          //   ),
                          //   child: Image.network(
                          //     value.product!.images[0],
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: value.product!.images
                                  .map(
                                    (e) => Container(
                                      height: 230,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blueGrey
                                                .withOpacity(0.5),
                                            offset: const Offset(0, 4),
                                            blurRadius: 15,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          e,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            alignment: Alignment.topLeft,
                            child: Text(
                              '${value.product!.price}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 15, top: 5, right: 40),
                            child: Text(
                              value.product!.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ).copyWith(left: 15),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'See all deals',
                              style: TextStyle(
                                color: Colors.cyan[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
