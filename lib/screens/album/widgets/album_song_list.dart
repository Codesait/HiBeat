import 'package:flutter/material.dart';
import 'package:get/utils.dart';
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

    final theme = Theme.of(context);

    print('songs from sliverlist: $songs');

    return songs.isNotEmpty ? SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: songs.length,
        (context, index) {

          final song = songs[index];
          return  DecoratedBox(
            decoration:  BoxDecoration(
              color: theme.scaffoldBackgroundColor,
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
    ): const  SliverToBoxAdapter(
      child:  ViewsParentContainer(
        notFound: true,
          child:  SizedBox.shrink(),
      ),
    );
  }
}
