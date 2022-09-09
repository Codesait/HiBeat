import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/src/screens.dart';
import 'package:hi_beat/src/utils.dart';

final splashViewModel = ChangeNotifierProvider((_) => SplashViewModel());

class SplashViewModel extends ChangeNotifier {
  void onSplashInit() {
    // on splash screen initialised, [hideToolBar]
    //will disable device tool bar
    Functions.hideToolBar();
    navigationDelay();
  }

  Future navigationDelay() async {
    /// Delaying the navigation for 3 seconds.
    Future.delayed(const Duration(seconds: 3)).then((val) {
      /// A custom function to navigate to the home screen.
      Nav.popTo(const HomeSreen());
    });
  }
}
