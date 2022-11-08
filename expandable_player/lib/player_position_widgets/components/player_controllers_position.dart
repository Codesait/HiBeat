import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

class PlayerControllersPosition extends StatelessWidget {
  const PlayerControllersPosition({
    super.key,
    required this.controller,
    required this.animationController,
  });

  final ExpandablePlayerController controller;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: fullHeight(context) / 2.5,
      width: fullWidth(context),
      bottom: controller.defaultControllersTopMargin(),
      child: Opacity(
        opacity: animationController.value,
        child: Container(
          width: fullWidth(context),
          color: Colors.orange,
          child: Column(
            children: const [
              MainPlayerSongDesc(),
              SizedBox(height: 8.0),
              SeekBarStreamWrap(),
              AudioControllers(isMiniPlayer: false)
            ],
          ),
        ),
      ),
    );
  }
}
