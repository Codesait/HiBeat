import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

class SeekBarStreamWrap extends StatelessWidget {
  const SeekBarStreamWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return SeekBar(
          duration: const Duration(minutes: 3),
          position: const Duration(minutes: 1),
          bufferedPosition: const Duration(milliseconds: 1500),
          onChangeEnd: (newPosition) {
            // audioHandler.seek(newPosition);
          },
        );
      },
    );
  }
}
