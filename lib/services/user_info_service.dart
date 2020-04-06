import 'dart:async';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:wholay/constants/key.dart';

class UserInfoService {
  final _secureStorage = FlutterSecureStorage();
  final CollectionReference _reference =
      Firestore.instance.collection(Key.USER_INFO_COLL);

  Future createOrUpdateProfile({
    @required String  uid,
    @required String  firstName,
    @required String  lastName,
    String            fullName,
    String            gender, // m = male, f = female
    String            race,
    String            nationality,
    String            religion,
    DateTime          birthdate,
    String            docCountry,
    String            docType,
    String            docNo,
    DateTime          docExpire,
    GeoPoint          location,
    String            addrNo,
    String            addrPlace,
    String            addrRoad,
    String            addrTumbol,
    String            addrAmphor,
    String            addrProvince,
    String            addrZipCode,
    String            addrCountry,
  }) async {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await _reference.document(uid).setData({
        'firstName'   : firstName,
        'lastName'    : lastName,
        'fullName'    : fullName,
        'gender'      : gender,
        'race'        : race,
        'nationality' : nationality,
        'religion'    : religion,
        'birthdate'   : birthdate,
        'docCountry'  : docCountry,
        'docType'     : docType,
        'docNo'       : docNo,
        'docExpire'   : docExpire,
        'location'    : location,
        'addrNo'      : addrNo,
        'addrPlace'   : addrPlace,
        'addrRoad'    : addrRoad,
        'addrTumbol'  : addrTumbol,
        'addrAmphor'  : addrAmphor,
        'addrProvince'  : addrProvince,
        'addrZipCode' : addrZipCode,
        'addrCountry' : addrCountry, 
      });
    });
  }

  Future profileInfo() async {
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
}
