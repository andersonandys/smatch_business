import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smatch_managment/features/home/home_view.dart';
import 'package:smatch_managment/features/home/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      lazy: false,
      child: const HomeView(),
    );
  }
}
