import 'package:flutter/material.dart';

class MusicTileDescription extends StatelessWidget {
  const MusicTileDescription(
      {super.key,
      this.songName,
      this.artist,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.padding = EdgeInsets.zero});
  final String? songName;
  final String? artist;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            '$songName',
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: theme.textTheme.bodyText2!.copyWith(fontSize: 15),
          ),
          Text(
            '$artist'.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: 10,
              wordSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }
}
