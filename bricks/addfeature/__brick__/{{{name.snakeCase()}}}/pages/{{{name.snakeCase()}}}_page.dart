import '../provider/{{{name.snakeCase()}}}_provider.dart';
import '{{{name.snakeCase()}}}_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class {{{name.pascalCase()}}}Page extends StatelessWidget {
  const {{{name.pascalCase()}}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => {{{name.pascalCase()}}}Provider(),
        child: const {{{name.pascalCase()}}}View(),
      );
  }
}
