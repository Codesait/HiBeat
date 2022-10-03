import 'package:flutter/material.dart';

class MusicTileDescription extends StatelessWidget {
  const MusicTileDescription({
    super.key,
    this.songName,
    this.artist,
  });
  final String? songName;
  final String? artist;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$songName',
            style: theme.textTheme.bodyText1,
          ),
          Text(
            '$artist',
            style: theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
