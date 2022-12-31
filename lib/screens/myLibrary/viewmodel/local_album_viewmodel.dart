import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/Service/local_library_service.dart';
import 'package:hi_beat/models/base_viewmodel.dart';
import 'package:on_audio_query/on_audio_query.dart';

final albumViewModel = ChangeNotifierProvider((_) => AlbumViewModel());

class AlbumViewModel extends BaseViewModel {
  final service = LocalLibraryService();

  List<AlbumModel> _albums = [];
  List<AlbumModel> get albums => _albums;

  Future<void> fetchAlbums() async {
    Future.delayed(const Duration(seconds: 1), () async {
      if (_albums.isEmpty) {
        isLoading(true);
        await service.getAlbums().then((res) {
          _albums = res;
        }).whenComplete(() {
          isLoading(false);
        });
      }
    });
  }
}
