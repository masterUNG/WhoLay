import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserAccountAPI {
  UserAccountAPI();

  static Stream<QuerySnapshot> stream =
      Firestore.instance.collection('userAccount').snapshots();

  static CollectionReference reference =
      Firestore.instance.collection('userAccount');

  static append(String email, String password, String mobileNo,
      String displayName, String motto) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.add({
        'email': email,
        'password': password,
        'mobileNo': mobileNo,
        'displayName': displayName,
        'motto': motto
      });
    });
  }

  static delete(String id) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.document(id).delete().catchError((error) {
        print(error);
      });
    });
  }

  static update(String id, String email) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.document(id).updateData({
        'email': email,
      }).catchError((error) {
        print(error);
      });
    });
  }
}
