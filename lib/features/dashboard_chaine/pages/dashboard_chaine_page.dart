import '../provider/dashboard_chaine_provider.dart';
import 'dashboard_chaine_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardChainePage extends StatelessWidget {
  const DashboardChainePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => DashboardChaineProvider(),
        child: const DashboardChaineView(),
      );
  }
}
