import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ArtistWidget extends StatelessWidget {
  const ArtistWidget({
    super.key,
    this.artist,
    this.artworkType,
    this.localArtistCoverId,
  });

  final String? artist;
  final ArtworkType? artworkType;
  final int? localArtistCoverId;

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
                localSongId: localArtistCoverId,
                artworkType: artworkType,
                radius: 100,
              ),
            ),
            const Gap(dimension: 10),
            Expanded(
              child: MusicTileDescription(
                title: artist ?? 'Unknown artist',
                mainAxisAlignment: MainAxisAlignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
