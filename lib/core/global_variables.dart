import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GlobalVariables {
  // COLORS
  static Color appBarColor = HexColor('#ddeff1');

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://assets.ajio.com/cms/AJIO/WEB/09032023-d-mhp-main-p2-brands-flat70.jpg',
    'https://assets.ajio.com/cms/AJIO/WEB/09032023-d-mhp-main-p4-brands-under599.jpg',
    'https://assets.ajio.com/cms/AJIO/WEB/09032023-d-mhp-main-p7-brands-upto70.jpg',
    'https://assets.ajio.com/cms/AJIO/WEB/23022023-UHP-D-MainBanner-P5-Puma-Min40.jpg',
    'https://assets.ajio.com/cms/AJIO/WEB/23022023-UHP-D-MainBanner-P6-WomensEthnciwear-GlobalDesiAurelia-Flat65.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'MENS',
      'image': 'assets/images/a1.jpg',
    },
    {
      'title': 'WOMENS',
      'image': 'assets/images/a3.jpg',
    },
    {
      'title': 'KIDS',
      'image': 'assets/images/a2.jpg',
    },
    {
      'title': 'SHOES',
      'image': 'assets/images/a4.jpg',
    },
    {
      'title': 'ACCESSORIES',
      'image': 'assets/images/a5.jpg',
    },
  ];
}
