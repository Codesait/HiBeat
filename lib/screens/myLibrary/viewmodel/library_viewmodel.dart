import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/src/res.dart';

final myLibraryViewmodel = ChangeNotifierProvider((_) => MyLibraryViewmodel());

class MyLibraryViewmodel extends ChangeNotifier {


  /// Creating a list of tab strings.
  final tabs = <String>[
    playlists,
    songs,
    albums,
    artists,
  ];


}
