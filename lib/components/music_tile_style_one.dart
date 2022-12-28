import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/utils.dart';

class MusicTileStyleOne extends StatelessWidget {
  const MusicTileStyleOne({super.key});

  final im =
      'https://www.thefarmersdog.com/digest/wp-content/uploads/2021/12/corgi-top-1400x871.jpg';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: fullHeight(context) * 0.1,
        width: fullWidth(context),
        padding: const EdgeInsets.only(left: 15),
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SongArt(
              networkImage: im,
              height: 80,
              width: 80,
            ),
            const Gap(dimension: 15),
            const Expanded(
              flex: 2,
              child: MusicTileDescription(
                songName: 'All of Me',
                artist: 'John Legend',
              ),
            ),
            const Expanded(
              child: Icon(
                Icons.more_horiz_outlined,
              ),
            )
          ],
        ),
      ),
    );
  }
}
