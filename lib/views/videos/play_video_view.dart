
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../model/video/video_model.dart';
import '../../themes/theme_text.dart';
import 'full_screen.dart';

class PlayVideoView extends StatefulWidget {
  final VideoModel video;
  const PlayVideoView({required this.video, super.key});
  @override
  _PlayVideoViewState createState() => _PlayVideoViewState();
}

class _PlayVideoViewState extends State<PlayVideoView> {
  late YoutubePlayerController _controller;
  late VideoPlayerController _videoController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.url.toString().length == 11
          ? widget.video.url.toString()
          : YoutubePlayer.convertUrlToId(widget.video.url.toString())
              .toString(),
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
    _videoController =
        VideoPlayerController.network(widget.video.url.toString())
          ..initialize().then((_) {
            _controller.play();
            setState(() {});
          });
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _videoController.pause();
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _videoController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.video.url!.contains('youtube') ||
            widget.video.url!.toString().length == 11
        ? YoutubePlayerBuilder(
            onExitFullScreen: () {
              // SystemChrome.setPreferredOrientations(DeviceOrientation.values);
            },
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              topActions: <Widget>[
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    _controller.metadata.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
              onReady: () {
                _isPlayerReady = true;
              },
            ),
            builder: (context, player) => Scaffold(
              appBar: AppBar(
                title: Text(
                  widget.video.title.toString(),
                  style: ThemeText.bodyBoldOne,
                ),
              ),
              body: ListView(
                children: [
                  player,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Get.height * 0.02),
                          child: Center(
                            child: Text(
                              'Description',
                              style: ThemeText.headlineOne,
                            ),
                          ),
                        ),
                        Text(
                          removeHtmlTags(widget.video.description.toString()),
                          style: ThemeText.bodyOne,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                widget.video.title.toString(),
                style: ThemeText.bodyBoldOne,
              ),
            ),
            body: ListView(
              children: [
                AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_videoController),
                      ClosedCaption(text: _videoController.value.caption.text),
                      // _ControlsOverlay(controller: _controller),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                          IconButton(
                            onPressed: () => Get.to(() =>
                                FullScreen(url: widget.video.url.toString())),
                            icon: Icon(
                              Icons.fullscreen,
                            ),
                          )
                        ],
                      ),
                      VideoProgressIndicator(_videoController,
                          allowScrubbing: true),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Get.height * 0.02),
                        child: Center(
                          child: Text(
                            'Description',
                            style: ThemeText.headlineOne,
                          ),
                        ),
                      ),
                      Text(
                        removeHtmlTags(widget.video.description.toString()),
                        style: ThemeText.bodyOne,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

//       child: Scaffold(
//         appBar: _youtubePlayerController.value.isFullScreen
//             ? null

//         body: Column(
//           children: [
//             widget.video.url!.contains('youtube')
//                 ? OrientationBuilder(
//                     builder: (context, orientation) {
//                       if (orientation == Orientation.landscape &&
//                           !_youtubePlayerController.value.isFullScreen) {
//                         // Entered fullscreen
//                         SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//                             overlays: []);
//                         SystemChrome.setPreferredOrientations([
//                           DeviceOrientation.landscapeLeft,
//                           DeviceOrientation.landscapeRight,
//                         ]);
//                       } else if (orientation == Orientation.portrait &&
//                           _youtubePlayerController.value.isFullScreen) {
//                         // Exited fullscreen
//                         SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//                             overlays: SystemUiOverlay.values);
//                         SystemChrome.setPreferredOrientations([
//                           DeviceOrientation.portraitUp,
//                           DeviceOrientation.portraitDown,
//                         ]);
//                       }
//                       return YoutubePlayer(
//                         controller: YoutubePlayerController(
//                           initialVideoId: YoutubePlayer.convertUrlToId(
//                                   widget.video.url.toString())
//                               .toString(),
//                         ),
//                         liveUIColor: Colors.amber,
//                       );
//                     },
//                   )
//                 : widget.video.url!.length == 12
//                     ? YoutubePlayer(
//                         controller: _youtubePlayerController,
//                       )
//                     : _controller.value.isInitialized

//                         : Container(),

