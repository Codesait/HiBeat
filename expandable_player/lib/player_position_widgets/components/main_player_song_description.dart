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
    final theme = Theme.of(context);
    return Container(
      height: 90,
      width: fullWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title(songTitle,theme),
          const SizedBox(height: 5.0),
          artistName(artist, theme),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }

  Widget title(String title, ThemeData theme) {
    return Text(
      title,
      maxLines: 1,
      textAlign: TextAlign.start,
      overflow: TextOverflow.fade,
      style:  theme.textTheme.bodyText2!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget artistName(String artist, ThemeData theme) {
    return Text.rich(
       TextSpan(
          children: [
             TextSpan(
              text: 'By: ',
                style: theme.textTheme.bodyText2!.copyWith(
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
      style: theme.textTheme.bodyText2!.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
