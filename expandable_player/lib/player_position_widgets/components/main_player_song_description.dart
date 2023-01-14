import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

class MainPlayerSongDesc extends StatelessWidget {
  const MainPlayerSongDesc({
    super.key,
    this.artist = 'Unknown',
    this.songTitle = 'Unknown',
  });

  final String songTitle;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: fullWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title(songTitle),
          const SizedBox(height: 5.0),
          artistName(artist),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      maxLines: 1,
      textAlign: TextAlign.start,
      overflow: TextOverflow.fade,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget artistName(String artist) {
    return Text.rich(
       TextSpan(
          children: [
            const TextSpan(
              text: 'By: ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                )
            ),
            TextSpan(
              text: artist,
            ),
          ],
          ),
      maxLines: 2,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.white54,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
