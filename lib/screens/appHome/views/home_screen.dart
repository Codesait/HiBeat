import 'package:flutter/material.dart';
import 'package:hi_beat/screens/appHome/widgets/home_wrapper.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      top: false,
      child: HomeWrapper(),
    );
  }
}
