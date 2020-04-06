import 'dart:async';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:wholay/constants/key.dart';

class UserService {
  final _secureStorage = FlutterSecureStorage();
  final CollectionReference _reference =
      Firestore.instance.collection(Key.USER_PROFILE);

  Future createOrUpdateProfile({
    @required String  uid,
    @required String  mobileNo,
    @required String  displayName,
    @required String  motto,
    String            avatarUrl,
    String            coverUrl,
    int               userLevel = 1,
  }) async {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await _reference.document(uid).setData({
        'mobileNo'    : mobileNo,
        'displayName' : displayName,
        'motto'       : motto,
        'avatarUrl'   : avatarUrl,
        'coverUrl'    : coverUrl,
        'userLevel'   : userLevel,
      });
    });
  }

  Future myProfile() async {
    Completer callback = new Completer();
    String uid = await _secureStorage.read(key: Key.USER_UID);
    Firestore.instance.runTransaction((Transaction transaction) async {
      _reference.document(uid).get().then((user) {
        callback.complete(user.data);
      }).catchError((error) {
        callback.completeError(error);
      });
    });
    return callback.future;
  }

  // Future updateMobileNo({
  //   @required String  uid,
  //   @required String  mobileNo,
  // }) async {
  //   Firestore.instance.runTransaction((Transaction transaction) async {
  //     await _reference.document(uid).setData({
  //       'mobileNo'    : mobileNo,
  //     });
  //   });
  // }
}
