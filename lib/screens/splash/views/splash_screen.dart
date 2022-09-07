import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: fullHeight(context) * 0.2,
              width: fullWidth(context) * 0.2,
              child: Image.asset(AppAssets.logo),
            ),
            const SizedBox(height: 20),
            const Text(
              appName,
              style: TextStyle(color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}
