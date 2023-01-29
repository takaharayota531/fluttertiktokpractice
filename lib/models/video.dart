import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tiktokpractice/constants.dart';

const USERNAME = "username";
const String UID = "uid";
const String ID = "id";

const String LIKES = "likes";
const String COMMENT_COUNT = "commentCount";
const String SHARE_COUNT = "shareCount";
const String SONG_NAME = "songName";
const String CAPTION = "caption";
const String VIDEO_URL = "videoUrl";
const String THUMBNAIL = "thumbnail";
const String PROFILE_PHOTO = "profilePhoto";

class Video {
  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.profilePhoto,
  });

  String username;
  String uid;
  String id;

  List likes;
  int commentCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePhoto;

  Map<String, dynamic> toJson() => {
        USERNAME: username,
        UID: uid,
        PROFILE_PHOTO: profilePhoto,
        ID: id,
        LIKES: likes,
        COMMENT_COUNT: commentCount,
        SHARE_COUNT: shareCount,
        SONG_NAME: songName,
        CAPTION: caption,
        VIDEO_URL: videoUrl,
        THUMBNAIL: thumbnail,
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Video(
        username: snapshot[USERNAME],
        uid: snapshot[UID],
        id: snapshot[ID],
        likes: snapshot[LIKES],
        commentCount: snapshot[COMMENT_COUNT],
        shareCount: snapshot[SHARE_COUNT],
        songName: snapshot[SONG_NAME],
        caption: snapshot[CAPTION],
        videoUrl: snapshot[VIDEO_URL],
        thumbnail: snapshot[THUMBNAIL],
        profilePhoto: snapshot[PROFILE_PHOTO]);
  }
}
