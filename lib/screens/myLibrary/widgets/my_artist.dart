import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/screens/myLibrary/viewmodel/local_artists_viewModel.dart';
import 'package:hi_beat/src/components.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MyArtists extends ConsumerStatefulWidget {
  const MyArtists({super.key});

  @override
  MyArtistsState createState() => MyArtistsState();
}

class MyArtistsState extends ConsumerState<MyArtists> {

  @override
  void initState() {
    ref.read(artistsViewModel).fetchArtists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(artistsViewModel);
    return provider.loading
        ? const ArtistGridLoader()
        : ViewsParentContainer(
            padding: const EdgeInsets.only(bottom: 190),
            child: GridView.builder(
              itemCount: provider.artists.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                final artist = provider.artists[index];
                return  ArtistWidget(
                  localArtistCoverId: artist.id,
                  artist: artist.artist,
                  artworkType: ArtworkType.ARTIST,
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 5,
                childAspectRatio: 0.7,
              ),
            ),
          );
  }
}
