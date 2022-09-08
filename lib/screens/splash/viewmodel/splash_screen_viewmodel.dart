import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/src/utils.dart';

final splashViewModel = ChangeNotifierProvider((_) => SplashViewModel());

class SplashViewModel extends ChangeNotifier {

  void onSplashInit() {
    
    // on splash screen initialised, [hideToolBar] 
    //will disable device tool bar
    Functions.hideToolBar();
  }
}
