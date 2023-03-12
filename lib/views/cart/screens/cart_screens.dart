import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/views/address/screens/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/custom_button.dart';
import '../../../providers/user_provider.dart';
import '../../home/widgets/addres_box.dart';
import '../../search/screens/search_screen.dart';
import '../widgets/cart_product.dart';
import '../widgets/cart_subtotal.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToAddress(int sum) {
    Navigator.pushNamed(
      context,
      Addrresscreen.routeName,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Cart',
            style: TextStyle(
                color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const AddressBox(),
                const SizedBox(height: 15),
                Container(
                  color: Colors.black12.withOpacity(0.08),
                  height: 1,
                ),
                const SizedBox(height: 5),
                ListView.builder(
                  itemCount: user.cart.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: CartProduct(
                        index: index,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 63,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CartSubtotal(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CustomButton(
                      text: 'Proceed to Buy (${user.cart.length} items)',
                      onTap: () => navigateToAddress(sum),
                      color: kblack,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
