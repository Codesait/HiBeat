import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/utils.dart';

class HomeWidgetsWrapper extends StatelessWidget {
  const HomeWidgetsWrapper({
    super.key,
    required this.child,
    required this.cateroryTitle,
  });
  final Widget child;
  final String cateroryTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: getContainerHeight(context) / 5,
      width: fullWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cateroryTitle),
          const Gap(dimension: 10),
          child,
        ],
      ),
    );
  }
}

class SuggestedArtists extends StatelessWidget {
  const SuggestedArtists({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeWidgetsWrapper(
        cateroryTitle: 'Artists You May Like.',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SizedBox(
              height: 50,
              width: 50,
              child: Placeholder(color: AppColors.primary),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: Placeholder(color: AppColors.primary),
            ),
          ],
        ));
  }
}
