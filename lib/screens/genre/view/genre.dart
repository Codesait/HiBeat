import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class GenreView extends StatelessWidget {
  const GenreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewsParentContainer(
      alignment: Alignment.center,
      child:  Text(
        'Genre',
      ),
    );
  }
}
