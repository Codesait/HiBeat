import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/utils.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CustomImageProvider extends StatelessWidget {
  const CustomImageProvider({
    Key? key,
    this.uri,
    this.imageUrl,
    this.height,
    this.width,
    this.radius = 20,
    this.localSongId,
    this.artworkType,
  }) : super(key: key);

  final Uri? uri;
  final String? imageUrl;
  final double? height;
  final double? width;
  final double radius;
  final int? localSongId;
  final ArtworkType? artworkType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? fullWidth(context),
      height: height ?? fullHeight(context) / 2,
      child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          clipBehavior: Clip.antiAlias,
          child: (uri != null)
              ? Image.file(
                  File(uri!.toFilePath()),
                  fit: BoxFit.cover,
                )
              : SongImageProvider(
                  isOnline: (localSongId == null && imageUrl != null),
                  imageUrl: imageUrl ?? '',
                  localsongId: localSongId,
                  artworkType: artworkType,
                )),
    );
  }
}

class SongImageProvider extends StatelessWidget {
  const SongImageProvider({
    super.key,
    this.isOnline = false,
    this.imageUrl,
    this.localsongId,
    this.artworkType,
  });
  final bool isOnline;
  final String? imageUrl;
  final int? localsongId;
  final ArtworkType? artworkType;

  @override
  Widget build(BuildContext context) {
    return isOnline
        ? CachedNetworkImage(
            fit: BoxFit.fill,
            errorWidget: (BuildContext context, _, __) => imagePlaceholder(),
            placeholder: (BuildContext context, _) => imagePlaceholder(),
            imageUrl: imageUrl!,
          )
        : QueryArtworkWidget(
            id: localsongId!,
            type: artworkType!,
            artworkBorder: BorderRadius.circular(7.0),
            keepOldArtwork: true,
            nullArtworkWidget: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: imagePlaceholder(),
            ),
          );
  }

  Widget imagePlaceholder() => Image(
        height: 30,
        width: 30,
        image: AssetImage(AppAssets.logo),
      );
}
