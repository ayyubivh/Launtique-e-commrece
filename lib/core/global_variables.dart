import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GlobalVariables {
  // COLORS
  static Color appBarColor = HexColor('#b3e5ec');
  static Color primaryColor = HexColor('#5ec5dc');
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

class Produt {
  final String productImageUrl;

  Produt(this.productImageUrl);
}

final introImage = [
  Produt(
      "https://burst.shopifycdn.com/photos/fashion-model-poses.jpg?width=925&format=pjpg&exif=1&iptc=1"),
  Produt(
    "https://images.pexels.com/photos/3812039/pexels-photo-3812039.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ),
  Produt(
    "https://images.pexels.com/photos/1233648/pexels-photo-1233648.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ),
  Produt(
    "https://assets.adidas.com/images/w_303,h_303,f_auto,q_auto,fl_lossy,c_fill,g_auto/f610db17b4c946c3b112af4a00a77e19_9366/adicolor-sst-track-jacket.jpg",
  ),
  Produt(
    "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60",
  ),
  Produt(
      "https://images.pexels.com/photos/10037708/pexels-photo-10037708.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
  Produt(
    "https://burst.shopifycdn.com/photos/fashion-model-poses.jpg?width=925&format=pjpg&exif=1&iptc=1",
  ),
];
