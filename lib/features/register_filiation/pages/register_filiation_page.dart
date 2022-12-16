import '../provider/register_filiation_provider.dart';
import 'register_filiation_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterFiliationPage extends StatelessWidget {
  const RegisterFiliationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => RegisterFiliationProvider(),
        child: const RegisterFiliationView(),
      );
  }
}
