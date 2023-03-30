import 'package:e_shoppie/common/serch_textform.dart';
import 'package:flutter/material.dart';
import '../../../core/global_variables.dart';
import '../../search/screens/search_screen.dart';
import '../widgets/carousel_images.dart';
import '../widgets/deal_of_day.dart';
import '../widgets/top_categories.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToSearchScreen(String query) {
      Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
    }

    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchTextForm(onFieldSubmit: navigateToSearchScreen),
              const CarouselImage(),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              const Categories(),
              const DealOfDay(),
            ],
          ),
        ),
      ),
    );
  }
}
