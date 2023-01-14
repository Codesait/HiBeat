import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hi_beat/src/res.dart';
import 'package:palette_generator/palette_generator.dart';

class Functions {
  static void hideToolBar() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void revealToolBar() {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  }

  String? getNumberOfSongs(String? numOfSongs) {
    if (numOfSongs != null) {
      final songs = int.parse(numOfSongs);
      if (songs > 1) {
        return '$numOfSongs songs';
      } else {
        return '$numOfSongs song';
      }
    } else {
      return null;
    }
  }

  Future<PaletteGenerator> colorPaletteGeneratorFromImage(Uint8List image) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.memory(image).image,
    );
    return paletteGenerator;
  }
}
