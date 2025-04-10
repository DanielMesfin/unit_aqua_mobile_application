import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoPath;
  final String audioPath;

  const VideoWidget({super.key, required this.videoPath, required this.audioPath});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoController;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    // Initialize video controller
    _videoController = VideoPlayerController.asset(widget.videoPath)
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {}); // Ensure the video updates once initialized
      })
      ..play();

    // Initialize audio player to play in the background
    // _audioPlayer = AudioPlayer();
    // _audioPlayer.setLoopMode(LoopMode.one); // Loop audio to sync with video
    // _audioPlayer.setAsset(widget.audioPath).then((_) {
    //   _audioPlayer.play();
    // });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoController.value.isInitialized
        ? SizedBox(
            height: 500,
            width: double.infinity,
            child: VideoPlayer(_videoController),
          )
        : Center(child: CircularProgressIndicator());
  }
}
