import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/utils.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicTileStyleOne extends StatelessWidget {
  const MusicTileStyleOne({
    super.key,
    this.songTitle,
    this.songArtist,
    this.localsongId,
    this.artworkType,
  });

  final String? songTitle;
  final String? songArtist;
  final int? localsongId;
  final ArtworkType? artworkType;

  final im =
      'https://www.thefarmersdog.com/digest/wp-content/uploads/2021/12/corgi-top-1400x871.jpg';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: fullHeight(context) * 0.1,
        width: fullWidth(context),
        padding: const EdgeInsets.only(left: 15),
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomImageProvider(
              height: 60,
              width: 60,
              radius: 10,
              localsongId: localsongId,
              artworkType: artworkType,
            ),
            const Gap(dimension: 15),
            Expanded(
              flex: 2,
              child: MusicTileDescription(
                songName: songTitle ?? 'Unknown',
                artist: songArtist ?? 'Unknown',
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
