import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/Service/local_library_service.dart';
import 'package:hi_beat/models/base_viewmodel.dart';
import 'package:on_audio_query/on_audio_query.dart';

final albumDetailViewModel =
ChangeNotifierProvider((_) => AlbumDetailViewModel());

class AlbumDetailViewModel extends BaseViewModel {
  final service = LocalLibraryService();

  List<SongModel> _localSongs = [];

  // getters
  List<SongModel> get localSongs => _localSongs;

  Future<void> fetchAlbumSongs({required int id}) async {
    Future.delayed(const Duration(seconds: 3), () {
      try{
        service.getAlbumSongs(id).then((res) {
          if(res.isNotEmpty){
            _localSongs = res;
            notifyListeners();
          }else{

          }

        });

      }catch(e){
        log(e.toString());
      }
    });


  }
}