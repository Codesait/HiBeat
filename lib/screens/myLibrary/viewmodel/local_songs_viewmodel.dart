import 'package:hi_beat/Service/local_library_service.dart';
import 'package:hi_beat/models/base_viewmodel.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsViewModel extends BaseViewModel {
  final service = LocalLibraryService();
  List<SongModel> _localSongs = [];
  List<dynamic> _localSongsMap = [];

  // getters
  List<SongModel> get localSongs => _localSongs;
  List<dynamic> get localSongsMap => _localSongsMap;

  Future<void> fetchLocalSongs() async {
    isLoading(true);
    service.getLocalSongs().whenComplete(() {
      _localSongs = service.fetchedSongs;
      _localSongsMap = service.cachedSongsMap;
      notifyListeners();
      isLoading(false);
    });
  }
}
