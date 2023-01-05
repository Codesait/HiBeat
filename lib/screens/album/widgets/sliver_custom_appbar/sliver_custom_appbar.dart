import 'package:flutter/material.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/screens.dart';

class SliverCustomAppBar extends StatelessWidget {
  const SliverCustomAppBar({
    Key? key,
    required this.maxAppBarHeight,
    required this.minAppBarHeight,
  }) : super(key: key);

  final double maxAppBarHeight;
  final double minAppBarHeight;

  @override
  Widget build(BuildContext context) {
    final extraTopPadding = MediaQuery.of(context).size.height * 0.05;
    //app bar content padding
    final padding = EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        right: 10,
        left: 10);

    return SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
            maxHeight: maxAppBarHeight,
            minHeight: minAppBarHeight,
            builder: (context, shrinkOffset) {

              /*
                sliver controllers
               */
              final double shrinkToMaxAppBarHeightRatio =
                  shrinkOffset / maxAppBarHeight;
              const double animateAlbumImageFromPoint = 20;
              final animateAlbumImage =
                  shrinkToMaxAppBarHeightRatio >= animateAlbumImageFromPoint;
              final animateOpacityToZero = shrinkToMaxAppBarHeightRatio > 0.6;
              final albumPositionFromTop = animateAlbumImage
                  ? (animateAlbumImageFromPoint - shrinkToMaxAppBarHeightRatio) *
                  maxAppBarHeight
                  : null;
              final albumImageSize =
                  MediaQuery.of(context).size.height * 0.3 - shrinkOffset / 2;
              final showFixedAppBar = shrinkToMaxAppBarHeightRatio > 0.7;
              final double titleOpacity = (showFixedAppBar
                  ? 1 - (maxAppBarHeight - shrinkOffset) / minAppBarHeight
                  : 0);

              //print(titleOpacity);


              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: albumPositionFromTop,
                    child: AlbumImage(
                      padding: padding,
                      animateOpacityToZero: animateOpacityToZero,
                      animateAlbumImage: animateAlbumImage,
                      shrinkToMaxAppBarHeightRatio:
                      shrinkToMaxAppBarHeightRatio,
                      albumImageSize: albumImageSize,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      gradient: showFixedAppBar
                          ? const  LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary,
                            AppColors.primary,
                          ],
                          stops: [
                            0,
                            0.5,
                          ])
                          : null,
                    ),
                    child: Padding(
                      padding: padding,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: double.maxFinite,
                        child: FixedAppBar(titleOpacity: titleOpacity),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
