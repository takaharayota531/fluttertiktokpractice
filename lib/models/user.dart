import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktokpractice/constants.dart';
import 'package:flutter/material.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String uid;

  User({
    required this.name,
    required this.email,
    required this.uid,
    required this.profilePhoto,
  });

  Map<String, dynamic> toJson() => {
        NAME: name,
        PROFILE_PHOTO: profilePhoto,
        EMAIL: email,
        UID: uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot[EMAIL],
      profilePhoto: snapshot[PROFILE_PHOTO],
      uid: snapshot[UID],
      name: snapshot[NAME],
    );
  }
}
