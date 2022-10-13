import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class GenreView extends StatelessWidget {
  const GenreView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "RED",
      "YELLOW",
      "BLACK",
      "CYAN",
      "BLUE",
      "GREY",
    ];

    final List<Widget> images = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.cyan,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.grey,
      ),
    ];
    return ViewsParentContainer(
      alignment: Alignment.center,
      child: VerticalCardPager(
          titles: titles, // required
          images: images, // required
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ), // optional
          onPageChanged: (page) {
            // optional
          },
          onSelectedItem: (index) {
            // optional
          },
          initialPage: 0, // optional
          align: ALIGN.LEFT // optional
          ),
    );
  }
}
