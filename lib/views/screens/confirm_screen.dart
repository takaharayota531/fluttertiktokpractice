import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:tiktokpractice/constants.dart';
import 'package:tiktokpractice/views/widgets/text_input_field.dart';
import 'package:tiktokpractice/controllers/upload_video_controller.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:video_player/video_player.dart';
// import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  final File videoFile;
  final String videoPath;
  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  late VideoPlayerController controller;

  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      if (UniversalPlatform.isWeb) {
        controller = VideoPlayerController.network(widget.videoPath);
      } else {
        controller = VideoPlayerController.file(widget.videoFile);
      }
      controller.initialize();
      controller.play();
      controller.setVolume(VIDEO_VOLUME);
      controller.setLooping(SET_LOOPING);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: VideoPlayer(controller),
          ),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _songController,
                    labelText: SONG_NAME,
                    icon: Icons.music_note,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _captionController,
                    labelText: CAPTION,
                    icon: Icons.closed_caption,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      uploadVideoController.uploadVideo(
                        _songController.text,
                        _captionController.text,
                        widget.videoPath,
                      );
                    },
                    child: const Text(
                      SHARE,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
