import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smatch_managment/app/constans/app_constants.dart';
import 'package:smatch_managment/core/models/business_model.dart';
import 'package:smatch_managment/features/home_business/provider/home_business_provider.dart';
import 'package:smatch_managment/features/home_business/widgets/selection_button.dart';
import 'package:smatch_managment/features/login/app_colors.dart';
import 'package:smatch_managment/features/login/app_styles.dart';

class DrawerWidget extends StatefulWidget {
  final HomeBuinessProvider homeProvider;

  final PageController pageController;

  const DrawerWidget({
    Key? key,
    required this.homeProvider,
    required this.pageController,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final HomeBuinessProvider homeBusinessProvider =
        context.watch<HomeBuinessProvider>();

    return Container(
      color: Theme.of(context).cardColor,
      width: 210,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/raster/logo-3.png",
                      height: 90,
                    ),
                    IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Text("NOTRE_LOGO"),
                const SizedBox(height: 10),
                DropdownButton(
                  value: homeBusinessProvider
                      .business[homeBusinessProvider.currenteIndexBusiness],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  items: homeBusinessProvider.business
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.id!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    homeBusinessProvider.currenteBusiness =
                        value as BusinessModel;
                    homeBusinessProvider.currenteIndexBusiness =
                        homeBusinessProvider.business.indexOf(value);
                    // homeBusinessProvider.updateIndexPage(0);
                    // widget.pageController.jumpToPage(0);
                    // Navigator.pop(context);
                  },
                ),
                 Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  context.go('/register');
                                },
                                borderRadius: BorderRadius.circular(5.0),
                                child: Ink(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 18.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Créer un compte",
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
          Expanded(
            child: SingleChildScrollView(
              // controller: ScrollController(),
              child: SelectionButtonWidget(
                data: [
                  SelectionButtonDataWidget(
                    activeIcon: EvaIcons.grid,
                    icon: Icons.table_chart_outlined,
                    label: "Tableau de bord",
                  ),
                  SelectionButtonDataWidget(
                    activeIcon: EvaIcons.archive,
                    icon: Icons.video_collection_outlined,
                    label: "Contenu",
                  ),
                  SelectionButtonDataWidget(
                    activeIcon: EvaIcons.calendar,
                    icon: Icons.playlist_play_outlined,
                    label: "Calendar",
                  ),
                  SelectionButtonDataWidget(
                    activeIcon: EvaIcons.calendar,
                    icon: Icons.playlist_play_outlined,
                    label: "Calendar",
                  ),
                  SelectionButtonDataWidget(
                    activeIcon: EvaIcons.calendar,
                    icon: Icons.playlist_play_outlined,
                    label: "Calendar",
                  ),
                  SelectionButtonDataWidget(
                    activeIcon: EvaIcons.calendar,
                    icon: Icons.playlist_play_outlined,
                    label: "Calendar",
                  ),
                ],
                onSelected: (index, value) {
                  if (widget.pageController.hasClients) {
                    widget.pageController.jumpToPage(index);

                    widget.homeProvider.currenteIndexPage = index;
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
