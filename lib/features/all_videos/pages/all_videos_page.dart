import '../provider/all_videos_provider.dart';
import 'all_videos_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllVideosPage extends StatelessWidget {
  const AllVideosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => AllVideosProvider(),
        child: const AllVideosView(),
      );
  }
}
