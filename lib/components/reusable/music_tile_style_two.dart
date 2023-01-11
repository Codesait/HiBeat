import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/screens.dart';
import 'package:hi_beat/src/utils.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicTileStyleTwo extends StatelessWidget {
  const MusicTileStyleTwo({
    super.key,
    this.albumTitle,
    this.albumDescription,
    this.artworkType,
    this.localAlbumCoverId,
    this.onTap,
  });

  final String? albumTitle;
  final String? albumDescription;
  final ArtworkType? artworkType;
  final int? localAlbumCoverId;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: CustomImageProvider(
                radius: 2,
                localSongId: localAlbumCoverId,
                artworkType: artworkType,
              ),
            ),
            const Gap(dimension: 10),
             Expanded(
              child: MusicTileDescription(
                title: albumTitle ?? 'Unknown',
                artist: albumDescription ?? 'Unknown',
                mainAxisAlignment: MainAxisAlignment.start,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
