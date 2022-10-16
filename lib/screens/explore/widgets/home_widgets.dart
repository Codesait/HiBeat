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
    final theme = Theme.of(context);

    return Container(
      width: fullWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cateroryTitle,
            style: theme.textTheme.headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(
                height: 50,
                width: 50,
                child: Placeholder(color: AppColors.primary),
              ),
            ],
          ),
        ));
  }
}

class MadeForYou extends StatelessWidget {
  const MadeForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeWidgetsWrapper(
        cateroryTitle: 'Made for you',
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(color: AppColors.primary),
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(color: AppColors.primary),
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(color: AppColors.primary),
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(color: AppColors.primary),
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(color: AppColors.primary),
              ),
            ],
          ),
        ));
  }
}

class NewReleases extends StatelessWidget {
  const NewReleases({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeWidgetsWrapper(
      cateroryTitle: 'Discover new releases',
      child: SizedBox(
        height: fullHeight(context) / 4,
        width: fullWidth(context),
        child: const Placeholder(color: AppColors.primary),
      ),
    );
  }
}

class FeaturedPlaylists extends StatelessWidget {
  const FeaturedPlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeWidgetsWrapper(
        cateroryTitle: 'Featured playlists',
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(color: AppColors.primary),
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(color: AppColors.primary),
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(color: AppColors.primary),
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(color: AppColors.primary),
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(color: AppColors.primary),
              ),
            ],
          ),
        ));
  }
}
