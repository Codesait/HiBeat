import 'package:flutter/material.dart';
import 'package:hi_beat/src/res.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: AppColors.black),
      child: const Text(
        'Favorite',
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
