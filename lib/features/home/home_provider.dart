import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int indexPage = 0;

  void updateIndexPage(int index) {
    indexPage = index;
    notifyListeners();
  }

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }
}
