import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class MySongs extends StatelessWidget {
  const MySongs({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewsParentContainer(
      padding: const EdgeInsets.only(bottom: 190),
      child: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const MusicTileStyleOne();
        },
      ),
    );
  }
}
