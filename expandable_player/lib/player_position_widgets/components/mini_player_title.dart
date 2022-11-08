import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

class MiniPlayerSongDsc extends StatelessWidget {
  const MiniPlayerSongDsc({
    super.key,
    required this.controller,
  });

  final ExpandablePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: controller.defaultSongArtSize, //<-- Specify icon's size
      width: fullWidth(context),
      left: fullWidth(context) / 10, //<-- Specify icon's left margin
      bottom: 5,
      child: Opacity(
        opacity: controller.isMiniPlayer
            ? ReverseAnimation(controller.controller).value
            : ReverseAnimation(controller.controller).value /
                controller.maxHeight,
        child: MiniPlayerSongTitle(
          isMiniPlayer: controller.isMiniPlayer,
        ),
      ),
    );
  }
}

class MiniPlayerSongTitle extends StatelessWidget {
  const MiniPlayerSongTitle({
    Key? key,
    required this.isMiniPlayer,
    this.artist = 'Unknown',
    this.songtitle = 'Unknown',
  }) : super(key: key);
  final String songtitle;
  final String artist;
  final bool isMiniPlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth(context),
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Song Title and artist displayed when the player is in a mini state
          SizedBox(
            width: fullWidth(context) / 2.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                title(songtitle),
                artistName(artist),
              ],
            ),
          ),
          const SizedBox(width: 10),

          //
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              child: AudioControllers(
                isMiniPlayer: isMiniPlayer,
                onSkipNext: () {},
                onSkipPrevious: () {},
              ),
            ),
          ),
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
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget artistName(String artist) {
    return Text(
      artist,
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
