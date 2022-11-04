import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

class PlayerControllersPosition extends StatelessWidget {
  const PlayerControllersPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: fullWidth(context),
      child: Column(
        children: const[
          MainPlayerSongDesc(),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}