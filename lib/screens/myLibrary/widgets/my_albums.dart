import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class MyAlbums extends StatelessWidget {
  const MyAlbums({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewsParentContainer(
      padding: const EdgeInsets.only(bottom: 190),
      child: GridView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          return const MusicTileStyleTwo();
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
      ),
    );
  }
}
