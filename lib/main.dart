import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smatch_managment/core/config/configure_web.dart';
import 'package:smatch_managment/core/config/app_router.dart';
import 'package:smatch_managment/core/provider/app_provider.dart';
import 'package:smatch_managment/firebase_options.dart';
import 'package:smatch_managment/features/login/login_screen.dart';

import 'app/config/routes/app_pages.dart';
import 'app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  usePathUrlStrategy();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppProvider(),
      child: MaterialApp.router(
        title: 'Smatch Business',
        debugShowCheckedModeBanner: false,
        // theme: AppTheme.basic,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
