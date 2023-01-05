import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/screens/myLibrary/viewmodel/local_album_viewmodel.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/screens.dart';
import 'package:hi_beat/src/utils.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MyAlbums extends ConsumerStatefulWidget {
  const MyAlbums({super.key});

  @override
  MyAlbumsState createState() => MyAlbumsState();
}

class MyAlbumsState extends ConsumerState<MyAlbums> {
  @override
  void initState() {
    ref.read(albumViewModel).fetchAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(albumViewModel);
    return provider.loading
        ? const AlbumGridLoader()
        : ViewsParentContainer(
            padding: const EdgeInsets.only(bottom: 190),
            notFound: provider.albums.isEmpty,
            child: GridView.builder(
              itemCount: provider.albums.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                final album = provider.albums[index];
                return  MusicTileStyleTwo(
                  key: Key(album.id.toString()),
                  onTap: (){
                    Nav.goTo( AlbumDetailedView(
                      albumModel: album,
                    ));
                  },
                  albumTitle: album.album,
                  albumDescription: album.artist,
                  artworkType: ArtworkType.ALBUM,
                  localAlbumCoverId: album.id,
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
            ),
          );
  }
}
