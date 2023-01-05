import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class AlbumInfo extends StatelessWidget {
  const AlbumInfo({
    Key? key,
    required this.infoBoxHeight,
    required this.albumTitle,
    required this.artist,
    this.albumDate,
    this.numOfSongs,

  }) : super(key: key);

  final double infoBoxHeight;
  final String albumTitle;
  final String artist;
  final String? albumDate;
  final String? numOfSongs;

  @override
  Widget build(BuildContext context) {

    String? numberOfSongs(){
      if(numOfSongs != null){
        final songs = int.parse(numOfSongs!);
        if (songs > 1) {
          return '$numOfSongs songs';
        } else {
          return '$numOfSongs song';
        }
      }else {
        return null;
      }
    }
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black87,
              ],
              stops: [
                0.00022,
                1.0,
              ]),
        ),
        child: SizedBox(
          height: infoBoxHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  albumTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                     Visibility(
                       visible: albumDate != null,
                       child: const CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage: NetworkImage('https://api.baskadia.com/static/page/29284/3ebd6bdf-a105-4e41-8635-59ac86d382a0.xs.jpg'),
                    ),
                     ),
                     Gap(dimension: albumDate != null ? 10: 0),
                     Text(
                      artist,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox.shrink()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  (albumDate ?? '') + (albumDate == null ? '': '.') + (numberOfSongs() ?? ''),
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
