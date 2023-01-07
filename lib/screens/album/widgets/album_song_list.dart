import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/res.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AlbumSongsList extends StatelessWidget {
  const AlbumSongsList({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<SongModel> songs;

  @override
  Widget build(BuildContext context) {

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: songs.length,
        (context, index) {
          final song = songs[index];

          return  DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.black,
            ),
            child: MusicTileStyleOne(
              songTitle: song.title,
              songArtist: song.artist,
              localSongId: song.id,
              artworkType: ArtworkType.AUDIO,
            ),
          );
        }
      ),
    );
  }
}
