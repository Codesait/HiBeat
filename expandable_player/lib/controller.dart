import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

class ExpandablePlayerController extends ChangeNotifier{

  final AnimationController controller; //<-- Create a controller
  final BuildContext context;
  ExpandablePlayerController(this.context,this.controller);

  // this section is for expandable player widget
  final double _minHeight = 60;
  final double _artStartSize = 60; //<-- add edge values
  final double _titleEndSize = 55;
  final double _titleEndMarginTop = 80;
  final double _titleStartMarginTop = 10;
  final double _artStartMarginTop = 8; //<-- add edge values
  final double _artEndMarginTop = 40; //<-- add edge values
  final double _artVerticalSpacing = 35; //<-- add edge values
  final double _artHorizontalSpacing = 25;


  bool _canPop = false;

  // getters

  bool get isMiniPlayer {
    return controller.status == AnimationStatus.dismissed;
  }

  double get minHeight => _minHeight;

  double? get headerTopMargin =>
      lerp(1, MediaQuery.of(context).padding.top); //<-- Add new property

  double? get headerFontSize => lerp(14, 24); //<-

  double get maxHeight => fullHeight(context);

  double? get songArtSize =>
      lerp(_artStartSize, fullWidth(context) / 1.2); //<-- increase icon size

  double? get songTitleSize =>
      lerp(_artStartSize, _titleEndSize); //<-- increase icon size

  double artTopMargin(int index) => lerp(
      _artStartMarginTop,
      _artEndMarginTop +
          index *
              (_artVerticalSpacing +
                  fullHeight(context) /
                      2.8))!; //<-- calculate top margin based on device fullheight

  double titleTopMargin(int index) =>
      lerp(_titleStartMarginTop,
          _titleEndMarginTop + index * (8 + _titleEndSize))! -
      10;
  double? artLeftMargin(int index, {double? deviceWidth}) => lerp(
      index * (_artHorizontalSpacing + songArtSize!),
      songArtSize! / 10); //<-- calculate left margin (from big to small)

  double? lerp(double min, double max) =>
      lerpDouble(min, max, controller.value);

  void toggle() {
    final bool isOpen = controller.status == AnimationStatus.completed;
    controller.fling(
        velocity: isOpen ? -2 : 2); //<-- ...snap the sheet in proper direction
  }

  Future<bool> willPopCallback() async {
    if (!isMiniPlayer) {
      controller.fling(velocity: -2);
      debugPrint('mini $isMiniPlayer');
    } else {
      _canPop = true;
      notifyListeners();
      debugPrint('mini $isMiniPlayer');
      Navigator.pop(context);
    }
    return _canPop;
  }

  void handleDragUpdate(DragUpdateDetails details) {
    controller.value -= (details.primaryDelta! /
        maxHeight); //<-- Update the _controller.value by the movement done by user.
  }

  void handleDragEnd(DragEndDetails details) {
    if (controller.isAnimating ||
        controller.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy /
        maxHeight; //<-- calculate the velocity of the gesture
    if (flingVelocity < 0.0) {
      controller.fling(
          velocity:
              math.max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      controller.fling(
          velocity:
              math.min(-2.0, -flingVelocity));
    } else {
      controller.fling(
          velocity: controller.value < 0.5
              ? -2.0
              : 2.0);
    } //<-- or just continue to whichever edge is closer
  }

}