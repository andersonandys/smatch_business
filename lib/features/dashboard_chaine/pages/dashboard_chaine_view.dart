import 'package:flutter/material.dart';

import '../provider/dashboard_chaine_provider.dart';
import 'package:provider/provider.dart';

class DashboardChaineView extends StatefulWidget {
  const DashboardChaineView({super.key});

  @override
  State<DashboardChaineView> createState() => _DashboardChaineViewState();
}

class _DashboardChaineViewState extends State<DashboardChaineView> {
  @override
  Widget build(BuildContext context) {
    final DashboardChaineProvider dashboardChaineProvider =
        context.read<DashboardChaineProvider>();

    return Scaffold(
      body: Center(
        child: Text("Hello World !"),
      ),
    );
  }
}
