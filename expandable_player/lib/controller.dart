import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

class ExpandablePlayerController extends ChangeNotifier {
  AnimationController controller; //<-- Create a controller
  final BuildContext context;
  ExpandablePlayerController(this.context, this.controller);

  // this section is for expandable player widget
  final double _minHeight = 68;
  final double _artStartSize = 50;
  final double _titleEndSize = 55;
  final double _playerControllersEndMarginTop = 10;
  final double _playerControllersStartMarginTop = 10;
  final double _artStartMarginTop = 7;
  final double _artEndMarginTop = 40;
  final double _artVerticalSpacing = 35;
  final double _artHorizontalSpacing = 25;

  bool _canPop = false;

  // getters

  bool get isMiniPlayer {
    return controller.status == AnimationStatus.dismissed;
  }

  // default style variables
  double? get defaultSongArtSize => lerp(_artStartSize, fullWidth(context));

  double defaultArtTopMargin() => lerp(_artStartMarginTop, 0)!;

  double defaultControllersTopMargin() =>
      lerp(_playerControllersStartMarginTop, _playerControllersEndMarginTop)!;

  double playerColapsedPosition() {
    if (fullHeight(context) > 700) {
      return fullHeight(context) / 9.5;
    }
    return fullHeight(context) / 12;
  }

  //ANOTHER STYLE

  double get minHeight => _minHeight;

  double get maxHeight => fullHeight(context);

  double? get headerTopMargin => lerp(1, MediaQuery.of(context).padding.top);

  double? get headerFontSize => lerp(14, 24);

  double? get songArtSize => lerp(_artStartSize, fullWidth(context) / 1.2);

  double? get songTitleSize => lerp(_artStartSize, _titleEndSize);

  double get widgetHorizontalMargin => isMiniPlayer ? 5 : 0;

  double get widgetVerticalMargin => isMiniPlayer ? 3 : 0;

  double get miniPlayerRadius => isMiniPlayer ? 5 : 0;

  double artTopMargin(int index) => lerp(
        _artStartMarginTop,
        _artEndMarginTop + index * (_artVerticalSpacing),
      )!;

  double titleTopMargin(int index) =>
      lerp(
        _playerControllersStartMarginTop,
        _playerControllersEndMarginTop + index * (8 + _titleEndSize),
      )! -
      10;
  double? artLeftMargin(int index, {double? deviceWidth}) => lerp(
        index * (_artHorizontalSpacing + songArtSize!),
        songArtSize! / 10,
      );

  double? lerp(double min, double max) => lerpDouble(
        min,
        max,
        controller.value,
      );

  void toggle() {
    final bool isOpen = controller.status == AnimationStatus.completed;
    controller.fling(velocity: isOpen ? -2 : 2);
    notifyListeners();
  }

  Future<bool> willPopCallback() async {
    /// This is the code that is executed when
    ///  the back button is pressed.
    if (!isMiniPlayer) {
      controller.fling(velocity: -2);
      notifyListeners();
    } else {
      _canPop = true;
      notifyListeners();
      Navigator.pop(context);
    }
    return _canPop;
  }

  void handleDragUpdate(DragUpdateDetails details) {
    controller.value -= (details.primaryDelta! / maxHeight);
    print('full height is: ${fullHeight(context).toString()}');
    notifyListeners();
  }

  void handleDragEnd(DragEndDetails details) {
    if (controller.isAnimating ||
        controller.status == AnimationStatus.completed) {
      return;
    }

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0) {
      controller.fling(velocity: math.max(2.0, -flingVelocity));
      notifyListeners();
    } else if (flingVelocity > 0.0) {
      controller.fling(velocity: math.min(-2.0, -flingVelocity));
      notifyListeners();
    } else {
      controller.fling(velocity: controller.value < 0.5 ? -2.0 : 2.0);
      notifyListeners();
    }
  }
}
