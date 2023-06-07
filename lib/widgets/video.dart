
import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum VideoType { asset, network }

class Video extends StatefulWidget {
  final String uri;
  final VideoType type;

  const Video({
    super.key,
    required this.uri,
    required this.type,
  });

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  @override
  void initState() {
    log("Video initState");
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    log("Video dispose");
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("Video build");
    return Expanded(
      child: _chewieController != null &&
              _videoPlayerController.value.isInitialized
          ? Chewie(
              controller: _chewieController!,
            )
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading')
              ],
            ),
    );
  }

  Future<void> initializeVideoPlayer() async {
    log("Video initializeVideoPlayer");
    switch (widget.type) {
      case VideoType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.uri);
        break;
      case VideoType.network:
        VideoPlayerController.network(widget.uri);
        break;
    }
    
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      // fullScreenByDefault: true,
      // progressIndicatorDelay:
      //     bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

      hideControlsTimer: const Duration(seconds: 1),

      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    log("Video initializeVideoPlayer complete");

    setState(() {});
  }
}
