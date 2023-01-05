import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';

class FixedAppBar extends StatelessWidget {
  const FixedAppBar({
    Key? key,
    required this.titleOpacity,
    required this.title
  }) : super(key: key);

  final double titleOpacity;
  final String title;

  @override
  Widget build(BuildContext context) {
    bool canCenterTitle = titleOpacity.clamp(0, 1) == 1.0;
    return Row(
      crossAxisAlignment: canCenterTitle ? CrossAxisAlignment.center : CrossAxisAlignment.baseline,
      textBaseline: canCenterTitle ? null : TextBaseline.ideographic,
      children: [
        const CustomBackButton(),
        const Gap(dimension: 10),
        AnimatedOpacity(
          opacity: titleOpacity.clamp(0, 1),
          duration: const Duration(milliseconds: 100),
          child:  Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),

        ),
      ],
    );
  }
}
