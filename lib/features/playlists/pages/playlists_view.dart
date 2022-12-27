import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/playlists_provider.dart';

class PlaylistsView extends StatefulWidget {
  const PlaylistsView({super.key});

  @override
  State<PlaylistsView> createState() => _PlaylistsViewState();
}

class _PlaylistsViewState extends State<PlaylistsView> {
  @override
  Widget build(BuildContext context) {
    final PlaylistsProvider playlistsProvider = context.read<PlaylistsProvider>();

    return Scaffold(
      body: Center(
        child: Text("Hello World !"),
      ),
    );
  }
}
