import 'package:flutter/material.dart';

export 'package:mini_player/player_position_widgets/components/player_appbar.dart';
export 'package:mini_player/controller.dart';
export 'package:mini_player/player_position_widgets/components/player_art_position.dart';
export 'package:mini_player/player_position_widgets/components/mini_player_title.dart';
export 'package:mini_player/player_position_widgets/components/audio_controllers.dart';
export 'package:mini_player/player_position_widgets/components/main_player_song_description.dart';
export 'package:mini_player/player_position_widgets/components/seek_bar.dart';
export 'package:mini_player/player_position_widgets/components/seekbar_stream_wrap.dart.dart';
export 'package:mini_player/player_position_widgets/components/player_controllers_position.dart';

///* [fullWidth] is used this for getting device full width
double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

///* [fullHeight] is used this for getting device full height
double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getContainerHeight(BuildContext context) {
  final mq = MediaQuery.of(context);
  return mq.size.height - AppBar().preferredSize.height - mq.padding.vertical;
}

extension FormatDuration on String {

  static const regx = r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$';



  //? regex for formatting song duration and position stream
  String? formatSeekStreamPositionDuration() => RegExp(regx)
      .firstMatch(this)
      ?.group(1);

  
}
