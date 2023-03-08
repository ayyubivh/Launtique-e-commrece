import 'package:flutter/material.dart';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 222, 225, 225),
      Color.fromARGB(255, 254, 254, 254),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://assets.ajio.com/cms/AJIO/WEB/23022023-UHP-D-MainBanner-P6-WomensEthnciwear-GlobalDesiAurelia-Flat65.jpg',
    'https://assets.ajio.com/cms/AJIO/WEB/D-UHP-ClearanceSale.jpg',
    'https://assets.ajio.com/cms/AJIO/WEB/UHP-D-clearance-flat50.jpg',
    'https://assets.ajio.com/cms/AJIO/WEB/23022023-UHP-D-MainBanner-P5-Puma-Min40.jpg',
    'https://assets.ajio.com/cms/AJIO/WEB/23022023-UHP-D-MainBanner-P6-WomensEthnciwear-GlobalDesiAurelia-Flat65.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Men',
      'image': 'assets/images/c1.jpg',
    },
    {
      'title': 'Women',
      'image': 'assets/images/lg3.jpg',
    },
    {
      'title': 'Kids',
      'image': 'assets/images/c5.jpg',
    },
    {
      'title': 'Footwear',
      'image': 'assets/images/c3.jpg',
    },
    {
      'title': 'Trending',
      'image': 'assets/images/c2.jpg',
    },
  ];
}
