import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tiktokpractice/constants.dart';
import 'package:tiktokpractice/models/user.dart' as model;
import 'package:tiktokpractice/views/screens/auth/login_screen.dart';

import '../views/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  late Rx<File?> _pickedImage;

  File? get ProfilePhoto => _pickedImage.value;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(FIREBASE_AUTH.currentUser);
    // 現在情報の取得
    _user.bindStream(FIREBASE_AUTH.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar(PROFILE_PICTURE, SUCCESSFULLY_UPLOAD_PICTURE);
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  //upload to firebase storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = FIREBASE_STORAGE
        .ref()
        .child(PROFILE_PICS)
        .child(FIREBASE_AUTH.currentUser!.uid);
    //ここで画像をアップロードするらしい
    UploadTask uploadTask = ref.putFile(image);
    // Future みたいな感じ
    TaskSnapshot snap = await uploadTask;
    // url get
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //registering user
  Future<void> registerUser(
      {required String username,
      required String email,
      required String password,
      required File? image}) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // save out user to our ath and firebase firestore
        UserCredential cred = await FIREBASE_AUTH
            .createUserWithEmailAndPassword(email: email, password: password);
        _uploadToStorage(image);
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
            name: username,
            email: email,
            uid: cred.user!.uid,
            profilePhoto: downloadUrl);
        await FIRESTORE
            .collection(USERS)
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          ERROR,
          ENTER_ALL_FIELDS,
        );
      }
    } catch (e) {
      Get.snackbar(
        ERROR,
        e.toString(),
      );
    }
  }

  void loginUser(String email, String password) async {
    print("email" + email);
    print("password" + password);
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential result = await FIREBASE_AUTH.signInWithEmailAndPassword(
            email: email, password: password);
        print("log success");
      } else {
        Get.snackbar(
          ERROR_LOGIN_USER,
          ENTER_ALL_FIELDS,
        );
      }
    } catch (e) {
      Get.snackbar(
        ERROR_LOGIN_USER,
        e.toString(),
      );
    }
  }
}
