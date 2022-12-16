import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smatch_managment/app/constans/app_constants.dart';
import 'package:smatch_managment/app/shared_components/selection_button.dart';
import 'package:smatch_managment/app/shared_components/upgrade_premium_card.dart';
import 'package:smatch_managment/features/home_chaine/home_provider.dart';
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
                  // center: center,
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
                    },
                    child: Text("Déconnexion")),
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
                    icon: Icons.archive_outlined,
                    label: "Reports",
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
                          "parametre",
                          style: TextStyle(
                            color: kFontColorPallets[1],
                            fontWeight: FontWeight.w600,
                            letterSpacing: .8,
                            fontSize: 13,
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left: 20 / 2),
                          child: Container(
                            width: 30,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: kNotifColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              (12 >= 100) ? "99+" : "12",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
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
