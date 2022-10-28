import 'package:flutter/material.dart';
import 'package:mini_player/utils.dart';

import 'pause_play_widget.dart';

class AudioControllers extends StatelessWidget {
  const AudioControllers({
    Key? key,
    this.onSkipNext,
    this.onSkipPrevious,
    this.currentRepeatMode,
    this.index = 0,
    this.handleReapeat,
    this.handleShuffle,
    this.shuffle = false,
    this.isMiniPlayer = false,
    this.isPlaying = false,
    this.isLoadingOrBuffering = false,
  }) : super(key: key);
  final VoidCallback? onSkipNext;
  final VoidCallback? onSkipPrevious;
  final String? currentRepeatMode;
  final bool shuffle;
  final VoidCallback? handleReapeat;
  final VoidCallback? handleShuffle;
  final int index;
  final bool isMiniPlayer;
  final bool isPlaying;
  final bool isLoadingOrBuffering;

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.repeat_rounded,
      Icons.repeat_rounded,
      Icons.repeat_one_rounded,
    ];

    final double btnSize = isMiniPlayer ? 45 : 59;
    final double indicatorSize = isMiniPlayer ? 30 : 60.5;
    final double strokeWidth = isMiniPlayer ? 2.0 : 4.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      width: fullWidth(context),
      child: Row(
        mainAxisAlignment: isMiniPlayer
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //* if state of player is mini player, this shuffle icon will
          //* replaces with a player icon
          isMiniPlayer
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    'assets/images/headphones_fill.png',
                    height: 27.0,
                    width: 27.0,
                  ),
                )
              : actions(
                  onPressed: handleShuffle,
                  iconData: Icons.shuffle_rounded,
                  iconColor: shuffle
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.grey,
                ),

          //* if state of player is mini player, this skip to prev icon button will
          //* replaces with an empty box
          isMiniPlayer
              ? const SizedBox()
              : actions(
                  onPressed: onSkipPrevious,
                  iconData: Icons.skip_previous_rounded,
                ),

          //* if state of player is mini player, this shuffle icon will
          //* replaces with a player icon
          Stack(
            children: [
              //* if state of media is loading, this loading indicator will
              //* replaces with an empty box
              Center(
                child: isLoadingOrBuffering
                    ? SizedBox(
                        height: indicatorSize,
                        width: indicatorSize,
                        child: CircularProgressIndicator(
                          strokeWidth: strokeWidth,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.secondary),
                        ),
                      )
                    : const SizedBox(),
              ),

              //* play/pause
              //Todo: pause and play functions
              PausePlayController(
                height: btnSize,
                width: btnSize,
                playing: isPlaying,
                onPause: () {},
                onPlay: () {},
              )
            ],
          ),

          //* skip to next song
          actions(onPressed: onSkipNext, iconData: Icons.skip_next_rounded),

          //* if state of player is mini player, this repeat icon will
          //* replaces with an empty box
          isMiniPlayer
              ? const SizedBox()
              : actions(
                  onPressed: handleReapeat,
                  iconData: icons[index],
                  iconColor: currentRepeatMode == 'None'
                      ? Colors.grey
                      : Theme.of(context).colorScheme.secondary,
                ),
        ],
      ),
    );
  }

  Widget actions({
    VoidCallback? onPressed,
    IconData? iconData,
    Color iconColor = Colors.white,
  }) {
    return IconButton(
        onPressed: onPressed,
        splashRadius: 55,
        color: iconColor,
        icon: Icon(
          iconData,
          size: 30,
        ));
  }
}
