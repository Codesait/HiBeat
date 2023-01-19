import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/utils.dart';

class AlbumInfo extends StatelessWidget {
  const AlbumInfo({
    Key? key,
    required this.infoBoxHeight,
    required this.albumTitle,
    required this.artist,
    this.albumDate,
    this.numOfSongs,
    this.isOfflinePlaylist = true,
  }) : super(key: key);

  final double infoBoxHeight;
  final String albumTitle;
  final String artist;
  final String? albumDate;
  final String? numOfSongs;
  final bool isOfflinePlaylist;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                theme.cardColor,
              ],
              stops: const [
                1.0022,
                1.0,
              ]),
        ),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: isOfflinePlaylist
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  albumTitle,
                  style: theme.textTheme.bodyText2!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:  AppColors.white
                  ),
                ),
                const Gap(
                  dimension: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: !isOfflinePlaylist,
                      child: const CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage: NetworkImage(
                            'https://api.baskadia.com/static/page/29284/3ebd6bdf-a105-4e41-8635-59ac86d382a0.xs.jpg'),
                      ),
                    ),
                    Gap(dimension: !isOfflinePlaylist ? 5 : 0),
                    Text(
                      artist,
                      style: theme.textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    const SizedBox.shrink()
                  ],
                ),
                const Gap(
                  dimension: 5,
                ),

                /*This is for displaying number of
                 songs in an album or playlist
                */
                Text(
                  (albumDate ?? '') +
                      (albumDate == null ? '' : '.') +
                      (Functions().getNumberOfSongs(numOfSongs) ?? ''),
                  style: theme.textTheme.bodyText1!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Gap(
                  dimension: 5,
                ),

                /* Row of album actions*/
                Visibility(
                  visible: !isOfflinePlaylist,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.download_outlined,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
