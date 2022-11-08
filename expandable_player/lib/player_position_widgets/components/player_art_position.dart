import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

class PlayerSongArtPosition extends StatelessWidget {
  const PlayerSongArtPosition({
    super.key,
    required this.controller,
    required this.songArtWidget,
  });

  final ExpandablePlayerController controller;

  final Widget songArtWidget;

  @override
  Widget build(BuildContext context) {
    final isMini = controller.isMiniPlayer;

    double? artSize() {
      if (isMini) {
        return controller.defaultSongArtSize;
      } else {
        return controller.defaultSongArtSize!;
      }
    }

    return Positioned(
      height: artSize(),
      width: controller.defaultSongArtSize,
      top: controller.defaultArtTopMargin(),
      child: songArtWidget,
    );
  }
}
