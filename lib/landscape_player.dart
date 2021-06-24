import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';


class LandscapePlayerPage extends StatefulWidget {
  String vkey;
  LandscapePlayerPage(this.vkey);
  @override
  _LandscapePlayerPageState createState() => _LandscapePlayerPageState();
}

class _LandscapePlayerPageState extends State<LandscapePlayerPage> {
  VideoPlayerController controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();

    controller= VideoPlayerController.network("https://www.youtube.com/watch?v=isOGD_7hNIY");
    // controller= VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _initializeVideoPlayerFuture = controller.initialize().then((value) {
      controller.play();
      setState(() {

    });
    });
    // controller = VideoPlayerController.network("https://www.youtube.com/watch?v="+ widget.vkey)
    //   ..addListener(() => setState(() {}))
    //   ..setLooping(true)
    //   ..initialize().then((_) => controller.play());

    setLandscape();
  }

  @override
  void dispose() {
    controller.dispose();
    setAllOrientations();

    super.dispose();
  }

  Future setLandscape() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // await Wakelock.enable();
  }

  Future setAllOrientations() async {
    await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

    // await Wakelock.disable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(future: _initializeVideoPlayerFuture,builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.done){

          return Center(
            child: AspectRatio(aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown
          setState(() {
            // If the video is playing, pause it.
            if (controller.value.isPlaying) {
              setState(() {

              controller.pause();
              });
            } else {
              // If the video is paused, play it.
              setState(() {

              controller.play();
              });
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      )
      ,
    );
  }

      // VideoPlayerFullscreenWidget(controller: controller);
}
