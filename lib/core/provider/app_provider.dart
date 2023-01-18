import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smatch_managment/core/config/app_contants.dart';
import 'package:smatch_managment/core/models/chaine_model.dart';
import 'package:smatch_managment/core/models/user_model.dart';

class AppProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  late UserModel _userData;

  Future<void> checkAuth(BuildContext context,
      {required String routePath,
      bool mounted = true,
      void Function()? verified,
      bool initData = false}) async {
    final User? user = _auth.currentUser;

    if (user != null) {
      if (initData) {
        await populateUserData(user);
      }
      if (!mounted) return;
      context.go('/$routePath');
    } else {
      context.go('/login');
    }
  }

  Future<void> populateUserData(User? user) async {
    if (user != null) {
      DocumentReference q =
          _db.collection(AppConstants.collectionUsersFS).doc(user.uid);

      _userData = UserModel.fromJson(q as Map<String, dynamic>);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await populateUserData(value.user);
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
    try {
      String? urlImage;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        String id = value.user!.uid;
        chaineModel.id = id;
        print("user registed");
        // id = value.user!.uid;

        DateTime.now().millisecondsSinceEpoch;

        if (webImage != null) {
          await FirebaseStorage.instance
              .ref()
              .child("files/${id + fileName!}")
              .putData(webImage)
              .then((p0) {
            p0.ref.getDownloadURL().then((value) {
              print("image saved");
              chaineModel.urlPicture = urlImage;
            });
          });
        }
        await FirebaseFirestore.instance
            .collection(AppConstants.collectionChaineFS)
            .doc(id)
            .set(chaineModel.toJson())
            .then((value) {
          print("save user");
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
