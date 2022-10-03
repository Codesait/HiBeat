import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class MyPlayLists extends StatelessWidget {
  const MyPlayLists({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewsParentContainer(
      alignment: Alignment.center,
      child: Text(
        'My playlists',
        style: TextStyle(),
      ),
    );
  }
}
