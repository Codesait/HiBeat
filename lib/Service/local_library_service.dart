import 'package:hi_beat/Service/audio_query.dart';
import 'package:on_audio_query/on_audio_query.dart';

class LocalLibraryService extends OfflineAudioQuery{


final Map<int, SongSortType> songSortTypes = {
    0: SongSortType.DISPLAY_NAME,
    1: SongSortType.DATE_ADDED,
    2: SongSortType.ALBUM,
    3: SongSortType.ARTIST,
    4: SongSortType.DURATION,
    5: SongSortType.SIZE,
  };

  final Map<int, OrderType> songOrderTypes = {
    0: OrderType.ASC_OR_SMALLER,
    1: OrderType.DESC_OR_GREATER,
  };


   /// [getLocalSongs] checks if permissions are granted, then fetch music
  Future<void> getLocalSongs() async {
    final List<SongModel> temp = await getSongs(
      sortType: songSortTypes[sortValue],
      orderType: songOrderTypes[orderValue],
    );
    _cachedSongs = temp
        .where(
          (i) =>
              (i.duration ?? 60000) > 1000 * minDuration &&
              (i.isMusic! || i.isPodcast! || i.isAudioBook!),
        )
        .toList();

    _added = true;

    _cachedSongsMap = await offlineAudioQuery.getArtwork(
      _cachedSongs,
      songsMap: _cachedSongsMap,
      artworkType: ArtworkType.AUDIO,
    );
    notifyListeners();
  }
}