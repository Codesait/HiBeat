import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

class PlayerSongArtPosition extends StatelessWidget {
  const PlayerSongArtPosition({
    super.key,
    required this.controller,
    required this.positionIndex,
    required this.songArtWidget,
  });

  final ExpandablePlayerController controller;

  final int positionIndex;

  final Widget songArtWidget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: controller.defaultSongArtSize,
      width: controller.defaultSongArtSize,
      top: controller.defaultArtTopMargin(positionIndex),
      child: songArtWidget,
    );
  }
}
