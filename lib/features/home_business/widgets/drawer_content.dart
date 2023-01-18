import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smatch_managment/app/constans/app_constants.dart';
import 'package:smatch_managment/app/shared_components/selection_button.dart';
import 'package:smatch_managment/features/home_business/home_business_provider.dart';
import 'package:smatch_managment/features/login/app_colors.dart';

class DrawerContent extends StatefulWidget {
  final HomeProvider homeProvider;

  final PageController pageController;

  const DrawerContent({
    Key? key,
    required this.homeProvider,
    required this.pageController,
  }) : super(key: key);

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 55,
                  lineWidth: 2.0,
                  percent: 0.5,
                  center: Image.asset("assets/images/raster/logo-3.png"),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.blueGrey,
                  progressColor: AppColors.mainBlueColor,
                ),
                const SizedBox(height: 10),
                const Text("projectName"),
                const SizedBox(height: 5),
                const Text("User Name"),
                TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                       if (!mounted) return;
                      context.go("/login");
                    },
                    child: const Text("Déconnexion")),
              ],
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: SingleChildScrollView(
              // controller: ScrollController(),
              child: SelectionButton(
                data: [
                  SelectionButtonData(
                    activeIcon: EvaIcons.grid,
                    icon: Icons.table_chart_outlined,
                    label: "Tableau de bord",
                  ),
                  SelectionButtonData(
                    activeIcon: EvaIcons.archive,
                    icon: Icons.video_collection_outlined,
                    label: "Contenu",
                  ),
                  SelectionButtonData(
                    activeIcon: EvaIcons.calendar,
                    icon: Icons.playlist_play_outlined,
                    label: "Calendar",
                  ),
                  SelectionButtonData(
                    activeIcon: EvaIcons.calendar,
                    icon: Icons.playlist_play_outlined,
                    label: "Calendar",
                  ),
                  SelectionButtonData(
                    activeIcon: EvaIcons.calendar,
                    icon: Icons.playlist_play_outlined,
                    label: "Calendar",
                  ),
                  SelectionButtonData(
                    activeIcon: EvaIcons.calendar,
                    icon: Icons.playlist_play_outlined,
                    label: "Calendar",
                  ),
                ],
                onSelected: (index, value) {
                  if (widget.pageController.hasClients) {
                    widget.pageController.jumpToPage(index);

                    widget.homeProvider.indexPage = index;
                  }
                  // homeProvider.indexPage = index;
                  log("index : $index | label : ${value.label}");
                },
              ),
            ),
          ),
          const Divider(thickness: 1),
          Column(
            children: [
              Material(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Icon(Icons.settings, size: 20),
                        const SizedBox(width: 20 / 2),
                        Expanded(
                            child: Text(
                          "Paramètre",
                          style: TextStyle(
                            color: kFontColorPallets[1],
                            fontWeight: FontWeight.w600,
                            letterSpacing: .8,
                            fontSize: 13,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
