

import 'package:flutter/material.dart';

import '../../export_files.dart';

class VideoView extends StatefulWidget {
  final videoUrl;
  final stopVideo;

  VideoView({
    this.videoUrl,
    this.stopVideo,
  });
  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  double volume = 80;
  String appID = "";
  String output = "";

  Future<void> initializePlayer() async {}
  ChewieController _chewieController;

  bool isPlaying = true;
  bool isBuffering = true;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      //* VideoPlayer Network constructor for playing video from internet
      videoPlayerController: VideoPlayerController.network(widget.videoUrl),

      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      looping: false,
      //allowFullScreen: false,
      fullScreenByDefault: false,
      showControlsOnInitialize: true,
      showControls: isBuffering,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: Str.POPPINS,
              ),
            ),
          ),
        );
      },
    );
    print("STOP VIDEO :: ${widget.stopVideo}");
    if(widget.stopVideo) {
      _chewieController.videoPlayerController.pause();
      _chewieController.videoPlayerController.dispose();
    }
  }

  void log(String message) {
    if (message != null) {
      setState(() {
        output = message;
      });
      print(message);
    }
  }

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
