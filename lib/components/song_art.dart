import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/utils.dart';

class SongArt extends StatelessWidget {
  const SongArt({
    Key? key,
    this.uri,
    this.networkImage = '',
    this.height,
    this.width,
  }) : super(key: key);

  final Uri? uri;
  final String networkImage;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? fullWidth(context),
      height: height ?? fullHeight(context) / 2,
      child: Card(
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        clipBehavior: Clip.antiAlias,
        child: (uri != null)
            ? Image.file(
                File(uri!.toFilePath()),
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                fit: BoxFit.fill,
                errorWidget: (BuildContext context, _, __) =>
                    imagePlaceholder(),
                placeholder: (BuildContext context, _) => imagePlaceholder(),
                imageUrl: networkImage,
              ),
      ),
    );
  }

  Widget imagePlaceholder() => Image(
        image: AssetImage(AppAssets.logo),
      );
}
