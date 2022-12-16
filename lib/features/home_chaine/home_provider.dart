import 'package:flutter/material.dart';

class HomeProvider {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int indexPage = 0;

  void updateIndexPage(int index) {
    indexPage = index;
    // notifyListeners();
  }

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }
}
