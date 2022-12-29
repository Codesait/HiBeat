import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class MusicTileStyleTwo extends StatelessWidget {
  const MusicTileStyleTwo({super.key});

  final im =
      'https://www.thefarmersdog.com/digest/wp-content/uploads/2021/12/corgi-top-1400x871.jpg';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: CustomImageProvider(
                imageUrl: im,
                radius: 2,
              ),
            ),
            const Gap(dimension: 10),
            const Expanded(
              child: MusicTileDescription(
                songName: 'All of Me',
                artist: 'John Legend',
                mainAxisAlignment: MainAxisAlignment.start,
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
