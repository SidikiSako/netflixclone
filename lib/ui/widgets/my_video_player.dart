import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/constant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyVideoPlayer extends StatelessWidget {
  final YoutubePlayerController controller;
  const MyVideoPlayer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressColors: const ProgressBarColors(
        //backgroundColor: kPrimaryColor,
        playedColor: kPrimaryColor,
        handleColor: kPrimaryColor,
      ),
      onReady: () {
        //widget.controller.play();
      },
      onEnded: (YoutubeMetaData meta) {
        controller.play();
        controller.pause();
      },
      //bottomActions: [],
    );
  }
}
