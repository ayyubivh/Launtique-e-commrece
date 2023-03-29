import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int page = 0;
  void updatePage(int pages) {
    page = pages;
    notifyListeners();
  }
}
