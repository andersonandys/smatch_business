import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smatch_managment/features/register/register_provider.dart';
import 'package:smatch_managment/features/register/register_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => RegisterProvider(),
      child:const RegisterView(),
    );
  }
}
