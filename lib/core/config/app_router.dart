import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smatch_managment/app/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:smatch_managment/features/home/home.dart';
import 'package:smatch_managment/features/login/login_screen.dart';
import 'package:smatch_managment/features/register/register_page.dart';
import 'package:smatch_managment/features/user_profile/user_profile.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      
      // initialLocation: "/",
      routes: <GoRoute>[
        GoRoute(
          path: "/",
          name: "home",
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
          routes: <GoRoute>[
            GoRoute(
              path: "login",
              name: "login",
              builder: (BuildContext context, GoRouterState state) {
                return const LoginScreen();
              },
              routes: const <GoRoute>[],
            ),
            GoRoute(
              path: "user",
              name: "user",
              builder: (BuildContext context, GoRouterState state) {
                return const UserProfile();
              },
              routes: const <GoRoute>[],
            ),
            GoRoute(
              path: "register",
              name: "register",
              builder: (BuildContext context, GoRouterState state) {
                return const RegisterPage();
              },
              routes: const <GoRoute>[],
            ),
          ],
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        final bool loggedIn = FirebaseAuth.instance.currentUser != null;
        print(loggedIn);
        final bool loggingIn = state.subloc == '/login';
        final bool register = state.subloc == '/register';

        // if (!loggedIn ) {
        //   return loggingIn? null:'/login';
        // }
        // if (loggingIn) {
        //    return "/";
        // }

        if (!loggedIn ) {
          if (register) {
            return '/register';
          }
          return '/login';
        }
        if (loggedIn) {
          if (loggingIn||register) {
            return "/";
          }
          return state.subloc;
        }

        return null;
      },
      refreshListenable:
          GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()));
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen((dynamic _) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;
}
