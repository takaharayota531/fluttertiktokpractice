import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktokpractice/controllers/auth_controller.dart';
import 'package:tiktokpractice/views/screens/add_video_screen.dart';
import 'package:tiktokpractice/views/screens/video_screen.dart';

//string
const String TITLE = "アンナビアプリ開発試作②tiktok";
const String HELLO_WORLD = "Hello World";
const String LOGIN_SCREEN = "Login Screen";
const String REGISTER = "Register";
const String USERNAME = "Username";
const String LOGIN = "Login";
const String EMAIL = "email";
const String PASSWORD = "password";
const String LOGIN_USER = "login user";
const String USERS = "users";
const String VIDEOS = "videos";
const String THUMBNAILS = "thumbnails";

const String ASK_HAVE_AN_ACCOUNT = "アカウントをお持ちでない場合";
const String ALREADY_HAVE_AN_ACCOUNT = "すでにアカウントをお持ちの場合";
const String NAVIGATING_USER = "Navigating user";
const String ERROR = "Error Creating Account";
const String ERROR_LOGIN_USER = "ログインに失敗しました";
const String ERROR_UPLOADING_VIDEO = "動画のアップロードに失敗しました";
const String ENTER_ALL_FIELDS = "記入漏れがないようにしてください";
const String PROFILE_PICS = "profilePics";
const String PROFILE_PICTURE = "プロフィール画像";
const String SUCCESSFULLY_UPLOAD_PICTURE = "プロフィール画像のアップロードに成功しました";

const String HOME = "Home";
const String SEARCH = "Search";
const String MESSAGES = "Messages";
const String PROFILE = "Profile";

const String NETWORK_IMAGE =
    "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png";

//double
const double FONT_SIZE_TITLE = 35.0;
const double FONT_SIZE_MINI = 25.0;

//colors
const BACKGROUND_COLOR = Colors.black;
var BUTTON_COLOR = Colors.red[400];
const BORDER_COLOR = Colors.grey;

//firebase
var FIREBASE_AUTH = FirebaseAuth.instance;
var FIREBASE_STORAGE = FirebaseStorage.instance;
var FIRESTORE = FirebaseFirestore.instance;

//firebase category
const String NAME = "name";
const String PROFILE_PHOTO = "profilePhoto";
// const String EMAIL = "email";
const String UID = "uid";

//firebase auth
// const String USERS = "users";

const String GALLERY = "Gallery";
const String CAMERA = "Camera";
const String CANCEL = "Cancel";
const String ADD_VIDEO = "Add Video";

const String SONG_NAME = "Song Name";
const String CAPTION = "Caption";
const String SHARE = "Share";


// controller
var AUTH_CONTROLLER = AuthController.instance;

//video player controller
const double VIDEO_VOLUME = 1;
const bool SET_LOOPING = true;

// yotta@example.com
// yotta1218

const String HOME_SCREEN = "Home Screen";
const String SEARCH_SCREEN = "Search Screen";
const String ADD_PAGE_SCREEN = "Add Page Screen";
const String MESSAGES_SCREEN = "Messages Screen";
const String PROFILE_SCREEN = "Profile Screen";
const pages = [
  VideoScreen(),
  Text(SEARCH_SCREEN),
  AddVideoScreen(),
  Text(MESSAGES_SCREEN),
  Text(PROFILE_SCREEN),
];
