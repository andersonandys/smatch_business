import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:smatch_managment/features/videos/pages/videos_page.dart';

import '../provider/all_videos_provider.dart';

class AllVideosView extends StatefulWidget {
  const AllVideosView({super.key});

  @override
  State<AllVideosView> createState() => _AllVideosViewState();
}

class _AllVideosViewState extends State<AllVideosView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AllVideosProvider allVideosProvider =
        context.watch<AllVideosProvider>();

    final List<String> towns = [
      "Vidéos",
      "Playlist",
    ];

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contenu de la chaîne",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 30),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: towns.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          if (_pageController.hasClients) {
                            _pageController.jumpToPage(index);

                            allVideosProvider.updateIndexPage(index);
                          }
                          log("index : $index | label : ${towns[index]}");
                          setState(() {});
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: allVideosProvider.indexPage == index
                                    ? 3
                                    : 1.5,
                                color: allVideosProvider.indexPage == index
                                    ? Colors.blue
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          child: Text(
                            towns[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: allVideosProvider.indexPage == index
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) =>
                  allVideosProvider.updateIndexPage(index),
              children: [
                const VideosPage(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Vos playlists s'afficheront ici.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(168, 168, 168, 1),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
