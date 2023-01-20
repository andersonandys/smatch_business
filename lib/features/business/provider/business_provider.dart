import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smatch_managment/core/config/app_contants.dart';
import 'package:smatch_managment/core/models/business_model.dart';

class BusinessProvider {
  ///All properties
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List businessList = [];

  Future<List<BusinessModel>?> getBusiness({required String userId}) async {
    List<BusinessModel> temp = [];

    try {
      await _db
          .collection(AppConstants.collectionBusinessFS)
          .where('uid', isEqualTo: userId)
          .where('type', isEqualTo: AppConstants.momentFieldFS)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          temp.add(BusinessModel.fromJson(element.data()));
          print(element.data());
        });
      });
      return temp;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<QuerySnapshot> getChat({required String userId}) {
    return _db
        .collection(AppConstants.collectionBusinessFS)
        .where('uid', isEqualTo: userId)
        .where('type', isEqualTo: AppConstants.momentFieldFS)
        .snapshots();
  }

  ///Methods

  ///Getters

  ///Setters

}
