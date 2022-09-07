import 'package:flutter/material.dart';
import 'package:hi_beat/app.dart';
import 'package:hi_beat/screens/settings/settings_controller.dart';

void main() {

  // controller
  final settingsController = SettingController();

  runApp(MyApp(settingsController: settingsController));
  
}
