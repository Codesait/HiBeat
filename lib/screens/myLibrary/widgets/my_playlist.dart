import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class MySongs extends StatelessWidget {
  const MySongs({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewsParentContainer(
      alignment: Alignment.center,
      child: Text(
        'My lib',
        style: TextStyle(),
      ),
      );
  }
}