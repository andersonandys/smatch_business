import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:smatch_managment/core/config/app_contants.dart';
import 'package:smatch_managment/core/models/chaine_model.dart';

class RegisterFiliationProvider {
  ///All properties

  ///Getters

  ///Setters

  ///Methods
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
            .collection(AppConstants.collectionBusinessFS)
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
