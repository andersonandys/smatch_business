import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text('Log Out'),
          ),
          ElevatedButton(
            onPressed: () {
               context.go('/user');
            },
            child: const Text('Go to user profile'),
          ),
        ],
      )),
    );
  }
}
