import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AlbumImage extends StatelessWidget {
  const AlbumImage({
    Key? key,
    required this.padding,
    required this.animateOpacityToZero,
    required this.animateAlbumImage,
    required this.shrinkToMaxAppBarHeightRatio,
    required this.albumImageSize,
    this.localSongId,
    this.artworkType,
  }) : super(key: key);

  final EdgeInsets padding;
  final bool animateOpacityToZero;
  final bool animateAlbumImage;
  final double shrinkToMaxAppBarHeightRatio;
  final double albumImageSize;
  final int? localSongId;
  final ArtworkType? artworkType;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: animateOpacityToZero
              ? 0
              : animateAlbumImage
              ? 1 - shrinkToMaxAppBarHeightRatio
              : 1,
          child: CustomImageProvider(
            height: albumImageSize,
            width: albumImageSize,
            localSongId: localSongId,
            artworkType: artworkType,
            radius: 0,
          ),
        ));
  }
}
