import 'package:flutter/material.dart';
import 'package:hi_beat/src/res.dart';

class MyLibraryView extends StatelessWidget {
  const MyLibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.black
      ),
      child: const Text('My lib',style: TextStyle(color: AppColors.white),),
    );
  }
}