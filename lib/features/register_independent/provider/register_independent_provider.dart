import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:smatch_managment/core/config/app_contants.dart';
import 'package:smatch_managment/core/models/business_model.dart';
import 'package:smatch_managment/core/models/chaine_model.dart';
import 'package:smatch_managment/core/models/user_model.dart';

class RegisterIndependentProvider extends ChangeNotifier {
  Uint8List? webImage;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> registerBusiness({
    required UserModel currentUser,
    required BusinessModel businessModel,
    Uint8List? image,
    String? fileName,
  }) async {
    DateTime.now().millisecondsSinceEpoch;
    try {
      await _db
          .collection(AppConstants.collectionBusinessFS)
          .add(businessModel.toJson())
          .then((value) async {
        await value.update({"idcompte": value.id});

        debugPrint(value.id);
        debugPrint("business saved");

        businessModel.id = value.id;
        if (image != null) {
          await FirebaseStorage.instance
              .ref()
              .child(
                  "${currentUser.uid}/business_moment/${businessModel.id}/${"${DateFormat('yyyy-MM-dd').format(DateTime.now())}.${fileName!.split('.').last}"}")
              .putData(image)
              .then((p0) {
            p0.ref.getDownloadURL().then((value) async {
              businessModel.urlPicture = value;
              debugPrint(value);

              await _db
                  .collection(AppConstants.collectionBusinessFS)
                  .doc(businessModel.id)
                  .update({"logo": businessModel.urlPicture});

              debugPrint("image saved");
            });
          });
        }

        print("save business");
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
