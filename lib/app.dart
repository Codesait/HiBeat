import 'package:flutter/material.dart';
import 'package:hi_beat/screens/settings/settings_controller.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return  MaterialApp(
          navigatorKey: navigatorKey,
          home: child,
        );
      },
    );
  }
}
