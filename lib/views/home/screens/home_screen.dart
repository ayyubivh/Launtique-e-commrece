import 'package:e_shoppie/common/serch_textform.dart';
import 'package:flutter/material.dart';
import '../../../core/global_variables.dart';
import '../../search/screens/search_screen.dart';
import '../widgets/carousel_images.dart';
import '../widgets/deal_of_day.dart';
import '../widgets/top_categories.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Container(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
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
        ),
        body: ListView(
          children: [
            SearchTextForm(onFieldSubmit: navigateToSearchScreen),
            // const AddressBox(),
            const CarouselImage(),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const TopCategories(),
            const DealOfDay(),
          ],
        ),
      ),
    );
  }
}
