import '../provider/videos_provider.dart';
import 'videos_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => VideosProvider(),
        child: const VideosView(),
      );
  }
}
