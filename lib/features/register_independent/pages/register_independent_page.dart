import '../provider/register_independent_provider.dart';
import 'register_independent_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterIndependentPage extends StatelessWidget {
  const RegisterIndependentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterIndependentProvider(),
      lazy: false,
      child: const RegisterIndependentView(),
    );
  }
}
