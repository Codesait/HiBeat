import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/screens/album/viewModel/albumViewModel.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/screens.dart';
import 'package:hi_beat/src/utils.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:palette_generator/palette_generator.dart';

class AlbumDetailedView extends ConsumerStatefulWidget {
  const AlbumDetailedView({
    Key? key,
    this.albumModel,
  }) : super(key: key);
  final AlbumModel? albumModel;

  @override
  AlbumDetailedViewState createState() => AlbumDetailedViewState();
}

class AlbumDetailedViewState extends ConsumerState<AlbumDetailedView> {
  late ScrollController _scrollController;

  late double maxAppBarHeight;
  late double minAppBarHeight;
  late double playPauseButtonSize;
  late double infoBoxHeight;

  @override
  void initState() {
    super.initState();
    ref.read(albumDetailViewModel).fetchAlbumSongs(id: widget.albumModel!.id);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    maxAppBarHeight = MediaQuery.of(context).size.height * 0.5;
    minAppBarHeight = MediaQuery.of(context).size.height * 0.1;
    playPauseButtonSize = (MediaQuery.of(context).size.width / 320) * 40 > 80
        ? 80
        : (MediaQuery.of(context).size.width / 320) * 40;
    infoBoxHeight = 140;

    final theme = Theme.of(context);
    final provider = ref.watch(albumDetailViewModel);

    return FutureBuilder<Uint8List?>(
        future: provider.service.getImageFromLocalStg(
          widget.albumModel!.id,
          ArtworkType.ALBUM,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder<PaletteGenerator>(
                future:
                    Functions().colorPaletteGeneratorFromImage(snapshot.data!),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<PaletteGenerator> snapshot,
                ) {
                  final viewPrimaryColor = snapshot.data?.dominantColor?.color;
                  return Scaffold(
                    body: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              snapshot.hasData
                                  ? viewPrimaryColor!
                                  : AppColors.grey,
                              theme.canvasColor,
                            ],
                            stops: const [
                              0.5,
                              0.6,
                            ]),
                      ),
                      child: Stack(
                        children: [
                          CustomScrollView(
                            controller: _scrollController,
                            slivers: [
                              SliverCustomAppBar(
                                maxAppBarHeight: maxAppBarHeight,
                                minAppBarHeight: minAppBarHeight,
                                appBarTitle: widget.albumModel!.album,
                                localSongId: widget.albumModel!.id,
                                artworkType: ArtworkType.ALBUM,
                              ),
                              AlbumInfo(
                                infoBoxHeight: infoBoxHeight,
                                albumTitle: widget.albumModel!.album,
                                artist: widget.albumModel!.artist ??
                                    'Unknown Artist',
                                numOfSongs:
                                    widget.albumModel!.numOfSongs.toString(),
                              ),
                              AlbumSongsList(
                                songs: provider.localSongs,
                              ),
                            ],
                          ),
                          PlayPauseButton(
                            scrollController: _scrollController,
                            maxAppBarHeight: maxAppBarHeight,
                            minAppBarHeight: minAppBarHeight,
                            playPauseButtonSize: playPauseButtonSize,
                            infoBoxHeight: infoBoxHeight,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const ViewsParentContainer(
              notFound: true,
              child: SizedBox.shrink(),
            );
          }
        });
  }
}
