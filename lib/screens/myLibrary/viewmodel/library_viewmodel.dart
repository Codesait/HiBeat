import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/screens.dart';

final myLibraryViewmodel = ChangeNotifierProvider((_) => MyLibraryViewmodel());

class MyLibraryViewmodel extends ChangeNotifier {
  /// Creating a list of tab strings.
  final tabs = <String>[
    songs,
    playlists,
    albums,
    artists,
  ];

  final tabViews = <Widget> [
    const MySongs(),
    const MyPlayLists(),
    const MyAlbums(),
    const MyArtists(),
  ];
}
