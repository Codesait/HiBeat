import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class MyLibraryView extends StatelessWidget {
  const MyLibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewsParentContainer(
      alignment: Alignment.center,
      child:  Text(
        'My lib',
        style: TextStyle(),
      ),
    );
  }
}
