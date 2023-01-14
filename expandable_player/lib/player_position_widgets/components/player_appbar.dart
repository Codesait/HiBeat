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
      top: 20,
      child: Opacity(
        opacity: controller.value,
        child: SizedBox(
          width: fullWidth(context),
          child: Padding(
            padding:  EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 10,
              right: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // collapse button
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: FittedBox(
                    child: IconButton(
                      onPressed: onMinimizeBtnTapped,
                      iconSize: 35,
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.expand_more_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const Text(
                  'Now Playing',style: TextStyle(fontSize: 20),
                ),

                const SizedBox.square(
                  dimension: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
