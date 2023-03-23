import 'package:e_shoppie/core/global_variables.dart';
import 'package:e_shoppie/providers/admin/admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/loader.dart';
import '../../account/widgets/single_product.dart';
import '../services/admin_services.dart';
import 'add_product_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    Provider.of<AdminProvider>(context, listen: false)
        .fetchAllProducts(context);
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AdminProvider>(
        builder: (context, products, child) => products.products == null
            ? const Loader()
            : GridView.builder(
                itemCount: products.products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = products.products![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(
                          image: productData.images[0],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              productData.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
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
