import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/screens.dart';
import 'package:hi_beat/src/utils.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewsParentContainer(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 40, bottom: 40),
      height: fullHeight(context),
      width: fullWidth(context),
      child: ListView(
        children: const [
          SuggestedArtists(),
          MadeForYou(),
          NewReleases(),
          FeaturedPlaylists()
        ],
      ),
    );
  }
}
