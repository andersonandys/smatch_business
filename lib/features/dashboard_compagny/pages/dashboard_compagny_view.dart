import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/dashboard_compagny_provider.dart';

class DashboardCompagnyView extends StatefulWidget {
  const DashboardCompagnyView({super.key});

  @override
  State<DashboardCompagnyView> createState() => _DashboardCompagnyViewState();
}

class _DashboardCompagnyViewState extends State<DashboardCompagnyView> {
  @override
  Widget build(BuildContext context) {
    final DashboardCompagnyProvider dashboardCompagnyProvider = context.read<DashboardCompagnyProvider>();

    return Scaffold(
          body: Center(
            child: Text("Hello World !"),
            ),
            );
  }
}
