import 'package:flutter/material.dart';

class AlbumImage extends StatelessWidget {
  const AlbumImage({
    Key? key,
    required this.padding,
    required this.animateOpacityToZero,
    required this.animateAlbumImage,
    required this.shrinkToMaxAppBarHeightRatio,
    required this.albumImageSize,
  }) : super(key: key);

  final EdgeInsets padding;
  final bool animateOpacityToZero;
  final bool animateAlbumImage;
  final double shrinkToMaxAppBarHeightRatio;
  final double albumImageSize;

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
          child: Container(
            height: albumImageSize,
            width: albumImageSize,
            decoration: const BoxDecoration(
              color: Colors.deepPurpleAccent,
              image: DecorationImage(
                image: NetworkImage('https://api.baskadia.com/static/page/29284/3ebd6bdf-a105-4e41-8635-59ac86d382a0.xs.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow:  [
                BoxShadow(
                  color: Colors.black87,
                  spreadRadius: 1,
                  blurRadius: 50,
                ),
              ],
            ),
          ),
        ));
  }
}
