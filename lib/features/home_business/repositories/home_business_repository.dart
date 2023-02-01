import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smatch_managment/core/config/app_contants.dart';
import 'package:smatch_managment/core/error/failure.dart';
import 'package:smatch_managment/core/models/business_model.dart';

class HomeBusinessRepository {
  Future<Either<Failure, User>> checkAuth() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;

    return user != null ? Right(user) : Left(ServerFailure());
  }

  Future<Either<Failure, List<BusinessModel>>> getBusiness({required String userId}) async {
    List<BusinessModel> temp = [];

    final FirebaseFirestore db = FirebaseFirestore.instance;

    try {
      await db
          .collection(AppConstants.collectionBusinessFS)
          .where('idcreat', isEqualTo: userId)
          .where('type', isEqualTo: AppConstants.momentFieldFS)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          temp.add(BusinessModel.fromJson(element.data()));
          print(element.data());
        });
      });
      return Right(temp);
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }
}
