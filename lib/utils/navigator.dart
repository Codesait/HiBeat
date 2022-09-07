import 'package:flutter/material.dart';
import 'package:hi_beat/app.dart';
import 'package:hi_beat/src/utils.dart';


class Nav {
  static const className = 'Navigtor';

  static void popTo( Widget page) {
    Navigator.pushReplacement(
      navigatorKey.currentContext!,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => page,
      ),
    ).whenComplete(() => getLogger(className).v('POPPED TO: $page'));
  }

  static void goTo(dynamic context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => page,
      ),
    ).whenComplete(() => getLogger(className).v('NAVIGATING TO: $page'));
  }


}
