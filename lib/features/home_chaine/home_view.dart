library dashboard;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smatch_managment/app/constans/app_constants.dart';
import 'package:smatch_managment/app/shared_components/get_premium_card.dart';
import 'package:smatch_managment/core/utils/responsive_builder.dart';
import 'package:smatch_managment/features/add_video.dart';
import 'package:smatch_managment/features/all_videos/pages/all_videos_page.dart';
import 'package:smatch_managment/features/dashboard_chaine/pages/dashboard_chaine_page.dart';
import 'package:smatch_managment/features/home_chaine/home_provider.dart';
import 'package:smatch_managment/features/home_chaine/widgets/drawer_content.dart';
import 'package:smatch_managment/features/uplaod_file/uplaod_file.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      key: homeProvider.scaffoldKey,
      backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: (MediaQuery.of(context).size.width < 1360) ? 4 : 3,
            child: DrawerContent(
              homeProvider: homeProvider,
              pageController: _pageController,
            ),
          ),
          Expanded(
            flex: 9,
            child: PageView(
              onPageChanged: (index) => homeProvider.updateIndexPage(index),
              controller: _pageController,
              children: const [
                DashboardChainePage(),
                AllVideosPage(),
                AddVideo(),
                UplaodFile(),
                AddVideo(),
                UplaodFile(),
                AddVideo(),
                UplaodFile(),
                AddVideo(),
                UplaodFile(),
                AddVideo(),
                UplaodFile(),
                AddVideo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
