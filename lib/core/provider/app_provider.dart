import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smatch_managment/core/config/app_contants.dart';
import 'package:smatch_managment/core/models/business_model.dart';
import 'package:smatch_managment/core/models/chaine_model.dart';
import 'package:smatch_managment/core/models/user_model.dart';

class AppProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  late UserModel currentUser;
  late BusinessModel businessSelected;

  Future<void> checkAuth(BuildContext context,
      {String? routePath,
      bool mounted = true,
      void Function()? verified,
      bool initData = true}) async {
    final User? user = _auth.currentUser;

    if (user != null) {
      if (initData) {
        await populateUserData(user);
      }
      // if (!mounted) return;
      // context.go('/$routePath');
    } else {
      context.go('/login');
    }
  }

  Future<void> populateUserData(User user) async {
    DocumentSnapshot doc = await _db
        .collection(AppConstants.collectionUsersFS)
        .doc(user.uid)
        .get();
    print(doc.data);

    currentUser = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    print(currentUser);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await populateUserData(value.user!);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required ChaineModel chaineModel,
    Uint8List? webImage,
    String? fileName,
  }) async {
    DateTime.now().millisecondsSinceEpoch;
    try {
      // String? urlImage;

      // fileName!.split('.').last;
      if (webImage != null) {
        await FirebaseStorage.instance
            .ref()
            .child(
                "${currentUser.uid}/business_moment/BUSINESS_ID/${DateTime.now().toIso8601String() + fileName!.split('.').last}")
            .putData(webImage)
            .then((p0) {
          p0.ref.getDownloadURL().then((value) {
            chaineModel.urlPicture = value;
            print("image saved");
          });
        });
      }

      await _db
          .collection(AppConstants.collectionBusinessFS)
          .add(chaineModel.toJson())
          .then((value) async {
        await value.update({"idcompte": value.id});
        print("save business");
      });
    } catch (e) {
      print(e);
    }
  }
}
