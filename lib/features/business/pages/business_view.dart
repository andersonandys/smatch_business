import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:smatch_managment/core/provider/app_provider.dart';
import 'package:smatch_managment/features/login/app_styles.dart';

import '../provider/business_provider.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  @override
  Widget build(BuildContext context) {
    final BusinessProvider businessProvider = context.read<BusinessProvider>();
    final AppProvider appProvider = context.read<AppProvider>();

    return Scaffold(
      body: FutureBuilder(
        future: appProvider.checkAuth(context,
            routePath: "mybusiness", initData: true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return StreamBuilder(
                stream: businessProvider.getChat(
                    userId: appProvider.currentUser.uid),
                // userId: "qXrcVtppK9O3kHB3HGACwM4RNYH3"),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (!snap.hasData || snap.data!.docs.isEmpty) {
                    return Center(
                      child: SizedBox(
                        width: 700,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Vous n'avais pas de compte businessn"),
                            const Text("Cliquer ici pour en créer un"),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  context.go('/register');
                                },
                                borderRadius: BorderRadius.circular(5.0),
                                child: Ink(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 70.0, vertical: 18.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "S'inscrire",
                                      style: ralewayStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.green,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (snap.hasError) {
                    return Center(
                      child: Text(snap.error.toString()),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snap.data!.docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snap.data!.docs[index]["nom"]),
                        );
                      },
                    );
                  }
                });
          }
        },
      ),
    );
  }
}
