import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Functions {
  static void hideToolBar() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }
}
