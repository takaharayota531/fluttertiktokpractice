import 'package:flutter/material.dart';
import 'package:tiktokpractice/constants.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({
    super.key,
    required this.videoUrl,
  });
  final String videoUrl;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // asset file どちらにも対応している
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(VIDEO_VOLUME);
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // メモリリークしてしまうから
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}
