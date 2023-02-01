import 'package:flutter/material.dart';
import 'package:smatch_managment/core/models/business_model.dart';

class HomeBuinessProvider extends ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currenteIndexPage = 0;
  int _currenteIndexBusiness = 0;
  List<BusinessModel> _business = [];
  late BusinessModel _currenteBusiness;
  // HomeBuinessProvider() {
  //   _business = [_business[currenteIndexBusiness]];
  // }

  List<BusinessModel> get business => _business;
  BusinessModel get currenteBusiness => _currenteBusiness;
  int get currenteIndexBusiness => _currenteIndexBusiness;

  set currenteBusiness(BusinessModel value) {
    _currenteBusiness = value;
    notifyListeners();
  }

  set business(List<BusinessModel> value) {
    _business = value;
    _currenteBusiness = _business[0];
    notifyListeners();
  }

  set currenteIndexBusiness(int value) {
    _currenteIndexBusiness = value;
    notifyListeners();
  }

  void updateIndexPage(int index) {
    currenteIndexPage = index;
    // notifyListeners();
  }

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }
}
