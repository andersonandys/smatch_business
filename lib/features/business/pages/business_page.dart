import '../provider/business_provider.dart';
import 'business_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => BusinessProvider(),
        child: const BusinessView(),
      );
  }
}
