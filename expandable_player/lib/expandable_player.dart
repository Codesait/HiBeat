library mini_player;

import 'package:flutter/material.dart';

import 'controller.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class ExpandablePlayer extends StatelessWidget {
  const ExpandablePlayer({
    super.key,
    required this.context,
    required this.animationController,
  });

  //* Build context
  final BuildContext context;

  //* animation controller
  final AnimationController animationController;

  Future<bool> lo() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    //* this is the package controller provider
    final controller = ExpandablePlayerController(
      context,
      animationController,
    );

    return WillPopScope(
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              //
              return const Positioned(
                child: Scaffold(),
              );
            }),
        onWillPop: () {
          return lo();
        });
  }
}
