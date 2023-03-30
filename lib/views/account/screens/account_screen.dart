import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:flutter/material.dart';
import '../../../common/serch_textform.dart';
import '../../../core/global_variables.dart';
import '../../search/screens/search_screen.dart';
import '../widgets/below_app_bar.dart';
import '../widgets/orders.dart';
import '../widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToSearchScreen(String query) {
      Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
    }

    return Scaffold(
      backgroundColor: kwhite,
      drawer: Container(),
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
          kHeight10,
          const BelowAppBar(),
          kHeight10,
          const TopButtons(),
          kHeight15,
          const Expanded(child: Orders()),
        ],
      ),
    );
  }
}
