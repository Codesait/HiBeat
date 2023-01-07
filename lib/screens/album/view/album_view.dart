import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/screens/album/viewModel/albumViewModel.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/screens.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AlbumDetailedView extends ConsumerStatefulWidget {
  const AlbumDetailedView({Key? key, this.albumModel,}) : super(key: key);
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
    ref.read(albumDetailViewModel).fetchAlbumSongs(widget.albumModel!.id);
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
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary,
                AppColors.black,
              ],
              stops: [
                0,
                0.7,
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
                ),
                AlbumInfo(
                  infoBoxHeight: infoBoxHeight,
                  albumTitle: widget.albumModel!.album,
                  artist:  widget.albumModel!.artist ?? 'Unknown Artist',
                  numOfSongs:  widget.albumModel!.numOfSongs.toString(),
                ),
                 AlbumSongsList(
                   songs: ref.read(albumDetailViewModel).localSongs,
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
  }
}
