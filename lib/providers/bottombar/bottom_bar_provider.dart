import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int page = 0;
  void updatePage(int page) {
    page = page;
    notifyListeners();
  }
}
