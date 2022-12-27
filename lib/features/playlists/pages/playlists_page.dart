import '../provider/playlists_provider.dart';
import 'playlists_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaylistsPage extends StatelessWidget {
  const PlaylistsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => PlaylistsProvider(),
        child: const PlaylistsView(),
      );
  }
}
