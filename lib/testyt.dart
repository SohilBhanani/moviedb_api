import 'package:flutter/material.dart';
import 'package:sohilbhanani_moviedb/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class YT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: '9O1Iy9od7-A', //Add videoID.
          flags: YoutubePlayerFlags(
            hideControls: false,
            controlsVisibleAtStart: true,
            autoPlay: true,
            mute: false,
          ),
        ),
        showVideoProgressIndicator: true,
        progressIndicatorColor: kPrim,
      ),
    );
  }
}






