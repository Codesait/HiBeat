import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

class PlayerAppBar extends StatelessWidget {
  const PlayerAppBar({
    super.key,
    required this.controller,
    this.onMinimizeBtnTapped,
  });

  ///* animation [controller] is required for real-time visibility update for this widget
  final AnimationController controller;

  ///* [onMinimizeBtnTapped] should be used to toggle player minimizer
  final Function()? onMinimizeBtnTapped;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 45,
      child: Opacity(
        opacity: controller.value,
        child: SizedBox(
          width: fullWidth(context),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: FittedBox(
                    child: IconButton(
                      onPressed: onMinimizeBtnTapped,
                      iconSize: 30,
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.expand_more_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
