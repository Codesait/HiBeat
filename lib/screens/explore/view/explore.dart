import 'package:flutter/material.dart';
import 'package:hi_beat/src/res.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: AppColors.black),
      child: const Text(
        'Explore',
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
