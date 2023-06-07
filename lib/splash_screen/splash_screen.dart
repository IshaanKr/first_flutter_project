import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:first_flutter_project/widgets/tataplay_container.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/video.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TataPlayContainer(
        child: Center(
          child: Column(
            children: [
              Video(
                uri: "assets/videos/splash_video.mp4",
                type: VideoType.asset,
              )
            ],
          ),
        ),
      ),
    );
  }
}
