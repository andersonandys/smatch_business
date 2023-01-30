import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smatch_managment/app/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:smatch_managment/features/business/pages/business_page.dart';
import 'package:smatch_managment/features/home_business/home_business_page.dart';
import 'package:smatch_managment/features/home_business/home_business_view.dart';
import 'package:smatch_managment/features/login/login_screen.dart';
import 'package:smatch_managment/features/register/register_page.dart';
import 'package:smatch_managment/features/register_filiation/pages/register_filiation_page.dart';
import 'package:smatch_managment/features/register_independent/pages/register_independent_page.dart';
import 'package:smatch_managment/features/register_select/register_select.dart';
import 'package:smatch_managment/features/user_profile/user_profile.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        name: "mybusiness",
        builder: (BuildContext context, GoRouterState state) {
          return const BusinessPage();
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
            path: "home",
            name: "home",
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
            routes: const <GoRoute>[],
          ),
          GoRoute(
            path: "register",
            name: "register",
            builder: (BuildContext context, GoRouterState state) {
              return const RegisterSelect();
            },
            routes: <GoRoute>[
              GoRoute(
                path: "independent",
                name: "independent",
                builder: (BuildContext context, GoRouterState state) {
                  return const RegisterIndependentPage();
                },
                routes: const <GoRoute>[],
              ),
              GoRoute(
                path: "filiale",
                name: "filiale",
                builder: (BuildContext context, GoRouterState state) {
                  return const RegisterFiliationPage();
                },
                routes: const <GoRoute>[],
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = FirebaseAuth.instance.currentUser != null;
      print(loggedIn);
      // final bool loggingIn = state.subloc == '/login';
      // final bool register = state.subloc == '/register';
      // final bool filiale = state.subloc == '/register/filiale';
      // final bool independent = state.subloc == '/register/independent';

      // if (!loggedIn ) {
      //   return loggingIn? null:'/login';
      // }
      // if (loggingIn) {
      //    return "/";
      // }

      // if (!loggedIn) {
      //   if (register || filiale || independent) {
      //     return state.subloc;
      //   }
      //   return '/login';
      // }
      // if (loggedIn) {
      //   if (loggingIn) {
      //     return "/";
      //   }
      //   return state.subloc;
      // }

      if (loggedIn) {
        return state.subloc;
      } else {
        return '/login';
      }

      // return null;
    },
    refreshListenable:
        GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen((dynamic _) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;
}
