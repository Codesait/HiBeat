import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/screens/splash/viewmodel/splash_screen_viewmodel.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/utils.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(splashViewModel).onSplashInit();
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
              height: fullHeight(context) * 0.3,
              width: fullWidth(context) * 0.3,
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
