import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smatch_managment/core/widgets/text_form_field_component.dart';
import 'package:smatch_managment/features/login/app_colors.dart';
import 'package:smatch_managment/features/login/app_icons.dart';
import 'package:smatch_managment/features/login/app_styles.dart';
import 'package:smatch_managment/features/login/responsive_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  bool _obscureText = true;

  @override
  void initState() {
    if (kDebugMode) {
      email = 'test@gmail123.com';
      password = "123456";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 700,
              child: Column(
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
                  SizedBox(height: height * 0.02),
                  Text(
                    'Hey, Enter your details to get sign in \nto your account.',
                    textAlign: TextAlign.center,
                    style: ralewayStyle.copyWith(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.12,
                      vertical: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.032,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.12,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ComponentTextFormField(
                            initialValue: email,
                            onSaved: (newValue) {
                              email = newValue;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                            hintText: "Email",
                          ),
                          SizedBox(height: height * 0.014),
                          ComponentTextFormField(
                            initialValue: password,
                            onSaved: (newValue) {
                              password = newValue;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
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
                            hintText: 'Enter Password',
                          ),
                          SizedBox(height: height * 0.05),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                if (kDebugMode) {
                                  _formKey.currentState!.save();
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: email!, password: password!)
                                      .then((value) {
                                   print( value.user!.uid);
                                  });
                                } else {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: email!, password: password!)
                                        .then((value) {
                                      value.user!.uid;
                                    });
                                  }
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
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       "Mot de passe oublié?",
                          //       style: ralewayStyle.copyWith(
                          //         fontSize: 12.0,
                          //         color: AppColors.mainBlueColor,
                          //         fontWeight: FontWeight.w600,
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
