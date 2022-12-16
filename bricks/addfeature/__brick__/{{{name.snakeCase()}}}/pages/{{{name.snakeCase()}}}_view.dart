import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/{{{name.snakeCase()}}}_provider.dart';

class {{{name.pascalCase()}}}View extends StatefulWidget {
  const {{{name.pascalCase()}}}View({super.key});

  @override
  State<{{{name.pascalCase()}}}View> createState() => _{{{name.pascalCase()}}}ViewState();
}

class _{{{name.pascalCase()}}}ViewState extends State<{{{name.pascalCase()}}}View> {
  @override
  Widget build(BuildContext context) {
    final {{{name.pascalCase()}}}Provider {{{name.camelCase()}}}Provider = context.read<{{{name.pascalCase()}}}Provider>();

    return Scaffold(
      body: Center(
        child: Text("Hello World !"),
      ),
    );
  }
}
