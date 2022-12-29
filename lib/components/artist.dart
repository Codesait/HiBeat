import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class ArtistWidget extends StatelessWidget {
  const ArtistWidget({super.key});

  final im =
      'https://www.thefarmersdog.com/digest/wp-content/uploads/2021/12/corgi-top-1400x871.jpg';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: CustomImageProvider(
                imageUrl: im,
                radius: 100,
              ),
            ),
            const Gap(dimension: 10),
            const Expanded(
              child: MusicTileDescription(
                songName: 'All of Me',
                mainAxisAlignment: MainAxisAlignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
