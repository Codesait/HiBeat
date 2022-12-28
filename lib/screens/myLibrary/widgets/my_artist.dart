import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class MyArtists extends StatelessWidget {
  const MyArtists({super.key});

  @override
  Widget build(BuildContext context) {
    //return const ArtistGridLoader();
    return ViewsParentContainer(
      padding: const EdgeInsets.only(bottom: 190),
      child: GridView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          return const ArtistWidget();
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 5,
          childAspectRatio: 0.7,
        ),
      ),
    );
  }
}
