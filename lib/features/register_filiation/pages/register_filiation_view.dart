import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:smatch_managment/core/config/app_contants.dart';
import 'package:smatch_managment/core/models/chaine_model.dart';
import 'package:smatch_managment/core/widgets/text_form_field_component.dart';
import 'package:smatch_managment/features/login/app_colors.dart';
import 'package:smatch_managment/features/login/app_styles.dart';
import 'package:smatch_managment/features/login/responsive_widget.dart';

import '../provider/register_filiation_provider.dart';

class RegisterFiliationView extends StatefulWidget {
  const RegisterFiliationView({super.key});

  @override
  State<RegisterFiliationView> createState() => _RegisterFiliationViewState();
}

class _RegisterFiliationViewState extends State<RegisterFiliationView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String id;
  late String name;
  late String firstName;
  late String lastName;
  late String canalName;
  bool free = true;
  final String type = "filiation";
  String? conpagnyName;
  String? desc;
  String? urlPicture;
  Uint8List? webImage;

  String? email;
  String? password;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final RegisterFiliationProvider registerFiliationProvider =
        context.read<RegisterFiliationProvider>();
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.02),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Smatch Business",
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainBlueColor,
                            fontSize: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.06,
                      vertical: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.032,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.07,
                      vertical: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Je m'inscris sous filiation",
                            textAlign: TextAlign.center,
                            style: ralewayStyle.copyWith(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: height * 0.04),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey[200],
                                backgroundImage: webImage == null
                                    ? null
                                    : MemoryImage(webImage!),
                                child: webImage == null
                                    ? const Icon(
                                        Icons.person,
                                        size: 50,
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    Uint8List? file = result.files.first.bytes;
                                    String fileName = result.files.first.name;
                                    setState(() {
                                      webImage = file!;
                                    });
                                  }
                                },
                                child: const Text("Selectionnez une image"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: ComponentTextFormField(
                                  onSaved: (newValue) {
                                    lastName = newValue!;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Champ ne peut pas être vide";
                                    }
                                    return null;
                                  },
                                  hintText: "Nom",
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ComponentTextFormField(
                                  onSaved: (newValue) {
                                    firstName = newValue!;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Champ ne peut pas être vide";
                                    }
                                    return null;
                                  },
                                  hintText: "Prénom",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ComponentTextFormField(
                                  onSaved: (newValue) {
                                    canalName = newValue!;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Champ ne peut pas être vide";
                                    }
                                    return null;
                                  },
                                  hintText: "Nom de ma chaîne",
                                ),
                              ),
                              const SizedBox(width: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Monétiser ma chaîne",
                                    textAlign: TextAlign.center,
                                    style: ralewayStyle.copyWith(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Switch(
                                    value: free,
                                    onChanged: (value) {
                                      setState(() {
                                        free = value;
                                      });
                                    },
                                    activeTrackColor: AppColors.mainBlueColor,
                                    activeColor: AppColors.mainBlueColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              // Expanded(
                              //   child: ComponentTextFormField(
                              //     onSaved: (newValue) {
                              //       canalName = newValue!;
                              //     },
                              //     validator: (value) {
                              //       if (value!.isEmpty) {
                              //         return "Champ ne peut pas être vide";
                              //       }
                              //       return null;
                              //     },
                              //     hintText: "Nom de ma chaîne",
                              //   ),
                              // ),
                              // const SizedBox(width: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Filale de :",
                                    textAlign: TextAlign.center,
                                    style: ralewayStyle.copyWith(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 220,
                                    child: DropdownButtonFormField(
                                      validator: (value) {
                                        if (value == null) {
                                          return "Champ ne peut pas être vide";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      hint: const Text(
                                          "Selectionnez une filiale"),
                                      items: const [
                                        DropdownMenuItem(
                                          value: "Brice",
                                          child: Text("Filière 1"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Brice",
                                          child: Text("Filière 2"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Filière 3",
                                          child: Text("Filière 3"),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: ComponentTextFormField(
                                  onSaved: (newValue) {
                                    email = newValue;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Champ ne peut pas être vide";
                                    }
                                    return null;
                                  },
                                  hintText: "Email",
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ComponentTextFormField(
                                  onSaved: (newValue) {
                                    password = newValue;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Champ ne peut pas être vide";
                                    }
                                    return null;
                                  },
                                  obscureText: _obscureText,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Mot de passe",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.014),
                          SizedBox(height: height * 0.05),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: email!, password: password!)
                                      .then((value) async {
                                    print("user registed");
                                    id = value.user!.uid;
                                    await FirebaseStorage.instance
                                        .ref()
                                        .child("files/$id")
                                        .putData(webImage!)
                                        .then((p0) {
                                      p0.ref.getDownloadURL().then((value) {
                                        print("image saved");
                                        ChaineModel chaineModel = ChaineModel(
                                          id: id,
                                          firstName: firstName,
                                          lastName: lastName,
                                          canalName: canalName,
                                          free: free,
                                          accountType: type,
                                          urlPicture: value,
                                        );
                                        FirebaseFirestore.instance
                                            .collection(
                                                AppConstants.collectionChaine)
                                            .doc(id)
                                            .set(chaineModel.toJson())
                                            .then((value) {
                                          print("save user");
                                          context.go("/");
                                        });
                                      });
                                    });
                                  });
                                }
                              },
                              borderRadius: BorderRadius.circular(5.0),
                              child: Ink(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 70.0, vertical: 18.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: AppColors.mainBlueColor,
                                ),
                                child: Center(
                                  child: Text(
                                    "S'inscrire",
                                    style: ralewayStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.whiteColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          const Divider(),
                          SizedBox(height: height * 0.03),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                context.go('/login');
                              },
                              borderRadius: BorderRadius.circular(5.0),
                              child: Ink(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 70.0, vertical: 18.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "Se connecter",
                                    style: ralewayStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
