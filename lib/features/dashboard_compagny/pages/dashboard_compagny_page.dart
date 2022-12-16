import '../provider/dashboard_compagny_provider.dart';
import 'dashboard_compagny_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardCompagnyPage extends StatelessWidget {
  const DashboardCompagnyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => DashboardCompagnyProvider(),
        child: const DashboardCompagnyView(),
      );
  }
}
