import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
// import 'package:image_picker_web/image_picker_web.dart';
import 'package:tiktokpractice/constants.dart';
import 'confirm_screen.dart';
import 'package:universal_platform/universal_platform.dart';
// import 'package:image_picker_for_web/image_picker_for_web.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      print("web でも動画をpick imageできる");
      if (UniversalPlatform.isWeb) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ConfirmScreen(
                  videoFile: File(video.path),
                  videoPath: video.path,
                )));
      } else {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ConfirmScreen(
                  videoFile: File(video.path),
                  videoPath: video.path,
                )));
      }
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.gallery, context),
            child: Row(children: const [
              Icon(Icons.image),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  GALLERY,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
          ),
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.camera, context),
            child: Row(children: const [
              Icon(Icons.camera_alt),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  CAMERA,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: Row(children: const [
              Icon(Icons.cancel),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  CANCEL,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () {
          showOptionsDialog(context);
        },
        child: Container(
          width: 190,
          height: 50,
          decoration: BoxDecoration(color: BUTTON_COLOR),
          child: const Center(
            child: Text(
              ADD_VIDEO,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      )),
    );
  }
}
