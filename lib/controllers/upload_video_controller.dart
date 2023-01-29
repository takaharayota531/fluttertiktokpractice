import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktokpractice/constants.dart';
import 'package:tiktokpractice/models/video.dart' as models;
import 'package:tiktokpractice/constants.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videoPath) async {
    print("compress start+$videoPath");

    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );
    // print(compressedVideo!.isCompressing);

    print("compress finish+$videoPath");
    // takahara.yota@gmail.com
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = FIREBASE_STORAGE.ref().child(VIDEOS).child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = FIREBASE_STORAGE.ref().child(THUMBNAILS).child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = FIREBASE_AUTH.currentUser!.uid;
      DocumentSnapshot userDoc =
          await FIRESTORE.collection(USERS).doc(uid).get();

      // get id
      var allDocs = await FIRESTORE.collection(VIDEOS).get();
      // get the length of docs
      int len = allDocs.docs.length;
      // create the video id by length

      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      String thumbnailUrl =
          await _uploadImageToStorage("Video $len", videoPath);

      models.Video video = models.Video(
          username: (userDoc.data()! as Map<String, dynamic>)[NAME],
          uid: uid,
          id: "Video $len",
          likes: [],
          commentCount: 0,
          shareCount: 0,
          songName: songName,
          caption: caption,
          videoUrl: videoUrl,
          thumbnail: thumbnailUrl,
          profilePhoto:
              (userDoc.data()! as Map<String, dynamic>)[PROFILE_PHOTO]);
      await FIRESTORE.collection(VIDEOS).doc("Video $len").set(video.toJson());
      print("success upload");
      Get.back();
    } catch (e) {
      print(e.toString());
      Get.snackbar(ERROR_UPLOADING_VIDEO, e.toString());
    }
  }
}
