import 'package:e_shoppie/core/global_variables.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/providers/admin/admin_provider.dart';
import 'package:e_shoppie/views/admin/shimmer/post_scrn_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../account/widgets/single_product.dart';
import 'add_product_screen.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AdminProvider>(context, listen: false)
          .fetchAllProducts(context);
    });
    void navigateToAddProduct() {
      Provider.of<AdminProvider>(context, listen: false).isLoading = false;
      Navigator.pushNamed(context, AddProductScreen.routeName);
    }

    return Scaffold(
      body: Consumer<AdminProvider>(
        builder: (context, products, child) => products.products == null
            ? const PostScreenShimmer()
            : GridView.builder(
                itemCount: products.products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = products.products![index];
                  return Padding(
                    padding:
                        const EdgeInsets.all(8.0).copyWith(bottom: 0, top: 0),
                    child: Column(
                      children: [
                        kHeight5,
                        SizedBox(
                          height: 140,
                          child: SingleProduct(
                            image: productData.images[0],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  productData.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                products.deleteProduct(
                                    productData, index, context);
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddProduct,
        tooltip: 'Add a Product',
        backgroundColor: GlobalVariables.primaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
