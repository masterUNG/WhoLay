import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wholay/services/user_service.dart';
import 'package:wholay/services/user_info_service.dart';
import 'package:flutter/widgets.dart';

class UserAccountModel {
  String            userId;
  String            email;
  String            mobileNo;
  String            displayName;
  String            motto;
  int               userLevel;
  String            coverUrl;
  String            avatarUrl;
  Image             coverImage;
  Image             userImage;
  String            firstName;
  String            lastName;
  String            fullName;
  String            gender; // m = male; f = female
  String            race;
  String            nationality;
  String            religion;
  DateTime          birthdate;
  String            docCountry;
  String            docType;
  String            docNo;
  DateTime          docExpire;
  GeoPoint          location;
  String            addrNo;
  String            addrPlace;
  String            addrRoad;
  String            addrTumbol;
  String            addrAmphor;
  String            addrProvince;
  String            addrZipCode;
  String            addrCountry;

  UserAccountModel({
    this.userId,
    this.email,
    this.mobileNo,
    this.displayName,
    this.motto,
    this.userLevel = 1,
    this.coverUrl,
    this.avatarUrl,
    this.coverImage,
    this.userImage,
    this.firstName,
    this.lastName,
    this.fullName,
    this.gender,
    this.race,
    this.nationality,
    this.religion,
    this.birthdate,
    this.docCountry,
    this.docType,
    this.docNo,
    this.docExpire,
    this.location,
    this.addrNo,
    this.addrPlace,
    this.addrRoad,
    this.addrTumbol,
    this.addrAmphor,
    this.addrProvince,
    this.addrZipCode,
    this.addrCountry,
  });

  final _userService = UserService();
  final _userInfo = UserInfoService();

  void getUserProfile() async {
    _userService.myProfile().then((profile) {
      mobileNo        = profile['mobileNo']; 
      displayName     = profile['displayName']; 
      motto           = profile['motto']; 
      userLevel       = profile['userLevel']; 
      coverUrl        = profile['coverUrl'];
      avatarUrl       = profile['avatarUrl'];
      if ((coverUrl != null) && (coverUrl.trim().isNotEmpty))
        coverImage = Image.network(coverUrl);
      if ((avatarUrl != null) && (avatarUrl.trim().isNotEmpty))
        userImage = Image.network(avatarUrl);
    });
  }

  void getUserInfo() async {
    _userInfo.profileInfo().then((data) {
      if (data != null) {
        userLevel       = 2;
        firstName       = data['firstName'];
        lastName        = data['lastName'];
        fullName        = data['fullName'];
        gender          = data['gender'];
        race            = data['race'];
        nationality     = data['nationality'];
        religion        = data['religion'];
        birthdate       = data['birthdate'];
        docCountry      = data['docCountry'];
        docType         = data['docType'];
        docNo           = data['docNo'];
        docExpire       = data['docExpire'];
        location        = data['location'];
        addrNo          = data['addrNo'];
        addrPlace       = data['addrPlace'];
        addrRoad        = data['addrRoad'];
        addrTumbol      = data['addrTumbol'];
        addrAmphor      = data['addrAmphor'];
        addrProvince    = data['addrProvince'];
        addrZipCode     = data['addrZipCode'];
        addrCountry     = data['addrCountry'];
      }
    }); 
  }

  void clearUserProfile() {
    userId = null;
    email = null;
    mobileNo = null;
    displayName = null;
    motto = null;
    userLevel = 1;
    coverUrl = null;
    avatarUrl = null;
    coverImage = null;
    userImage = null;    
    firstName = null;
    lastName = null;
    fullName = null;
    gender = null;
    race =  null;
    nationality = null;
    religion = null;
    birthdate = null;
    docCountry = null;
    docType = null;
    docNo = null;
    docExpire = null;
    location = null;
    addrNo = null;
    addrPlace = null;
    addrRoad = null;
    addrTumbol = null;
    addrAmphor = null;
    addrProvince = null;
    addrZipCode = null;
    addrCountry = null;
  }

  void clearUserInfo() {
    firstName = null;
    lastName = null;
    fullName = null;
    gender = null;
    race =  null;
    nationality = null;
    religion = null;
    birthdate = null;
    docCountry = null;
    docType = null;
    docNo = null;
    docExpire = null;
    location = null;
    addrNo = null;
    addrPlace = null;
    addrRoad = null;
    addrTumbol = null;
    addrAmphor = null;
    addrProvince = null;
    addrZipCode = null;
    addrCountry = null;
  }

  // UserAccountModel.fromMap(Map<String, dynamic> map, {this.reference})
  //     : assert(map['userId'] != null),
  //       assert(map['email'] != null),
  //       assert(map['password'] != null),
  //       userId = map['userId'],
  //       email = map['email'],
  //       password = map['password'],
  //       mobileNo = map['mobileNo'],
  //       displayName = map['displayName'],
  //       motto = map['motto'],
  //       userLevel = map['userLevel'];

  // UserAccountModel.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data, reference: snapshot.reference);
}
