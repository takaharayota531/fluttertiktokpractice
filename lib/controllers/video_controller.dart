import 'package:get/get.dart';
import 'package:tiktokpractice/constants.dart';
import 'package:tiktokpractice/models/video.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _videoList.bindStream(
        FIRESTORE.collection(VIDEOS).snapshots().map((QuerySnapshot query) {
      List<Video> retVal = [];
      for (var element in query.docs) {
        retVal.add(
          Video.fromSnap(element),
        );
      }
      return retVal;
    }));
  }
}
