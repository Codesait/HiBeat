import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/Service/local_library_service.dart';
import 'package:hi_beat/models/base_viewmodel.dart';
import 'package:on_audio_query/on_audio_query.dart';

final artistsViewModel = ChangeNotifierProvider((_) => LocalArtistsViewModel());

class LocalArtistsViewModel extends BaseViewModel {
  final service = LocalLibraryService();

  List<ArtistModel> _artists = [];
  List<ArtistModel> get artists => _artists;

  Future<void> fetchArtists() async {
    Future.delayed(const Duration(seconds: 1), () async {
      if (_artists.isEmpty) {
        isLoading(true);
        await service.getArtists().then((res) {
          _artists = res;
        }).whenComplete(() {
          isLoading(false);
        });
      }
    });
  }
}
