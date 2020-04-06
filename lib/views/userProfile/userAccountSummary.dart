import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/main.dart';
import 'package:wholay/services/user_service.dart';
import 'package:wholay/views/userProfile/skill_options.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/widgets/userProfile/userProfileWidget.dart';
import 'package:wholay/views/userProfile/mobileNoEntry.dart';
import 'package:wholay/views/userProfile/emailVerify.dart';
import 'package:wholay/views/userProfile/passwordCorrect.dart';
import 'package:wholay/views/userProfile/userAccountRegistDetailEntry.dart';
import 'package:wholay/views/userProfile/userAccountRegistDetailSummary.dart';
import 'package:wholay/views/userProfile/userProfileOptions.dart';
import 'package:wholay/views/userProfile/userAccountConfirm.dart';
import 'package:wholay/dialogs.dart';


class PageMenus{
  static const String settingMenu = 'ตั้งค่าข้อมูลส่วนบุคคล';
  static const String divider = '-';
  static const String selectBackgroundMenu = 'เลือกภาพพื้นหลัง';
  static const String selectAvatarMenu = 'เลือกรูปประจำตัว';
  static const String takePhotoMenu = 'เปิดกล้องถ่ายภาพ';

  static const List<String> menus = <String>[
    settingMenu,
    divider,
    selectBackgroundMenu,
    selectAvatarMenu,
    takePhotoMenu
  ];
}

class UserAccountSummaryPage extends StatefulWidget {
  @override
  _UserAccountSummaryPageState createState() => _UserAccountSummaryPageState();
}

class _UserAccountSummaryPageState extends State<UserAccountSummaryPage> {

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final UserService _userService = UserService();

  File _bgImg = null;
  File _avatarImg = null;

  void menuAction(String menu) {

  }

  _onSelectAvatar(File image) async {
    try {
      if ((image != null) && (userModel.userId != null)) {
        final StorageUploadTask uploadTask =
          _storage.ref().child("avatar/${userModel.userId}").putFile(image);
        final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
        final String url = (await downloadUrl.ref.getDownloadURL());

        _userService.createOrUpdateProfile(
          uid: userModel.userId,
          displayName: userModel.displayName,
          motto: userModel.motto,
          mobileNo: userModel.mobileNo,
          avatarUrl: url,
          coverUrl: userModel.coverUrl,
        ).then((_) 
          async{
            userModel.avatarUrl = url;
            userModel.userImage = Image.file(image);
            setState(() {});
          }
        );
      }
      setState(() {});
    } on Exception catch(e) {
      errorDialog(context, 'Error', e.toString());
    }    
  }

  _onTakeAvatarPhoto(File image) async {
    try {
      if ((image != null) && (userModel.userId != null)) {
        final StorageUploadTask uploadTask =
          _storage.ref().child("avatar/${userModel.userId}").putFile(image);
        final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
        final String url = (await downloadUrl.ref.getDownloadURL());

        _userService.createOrUpdateProfile(
          uid: userModel.userId,
          displayName: userModel.displayName,
          motto: userModel.motto,
          mobileNo: userModel.mobileNo,
          avatarUrl: url,
          coverUrl: userModel.coverUrl,
        ).then((_) 
          async{
            userModel.avatarUrl = url;
            userModel.userImage = Image.file(image);
            setState(() {});
          }
        );
      }
      setState(() {});
    } on Exception catch(e) {
      errorDialog(context, 'Error', e.toString());
    }    
  }

  _onSelectBackground(File image) async {
    try {
      if ((image != null) && (userModel.userId != null)) {
        final StorageUploadTask uploadTask =
          _storage.ref().child("cover/${userModel.userId}").putFile(image);
        final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
        final String url = (await downloadUrl.ref.getDownloadURL());

        _userService.createOrUpdateProfile(
          uid: userModel.userId,
          displayName: userModel.displayName,
          motto: userModel.motto,
          mobileNo: userModel.mobileNo,
          avatarUrl: userModel.avatarUrl,
          coverUrl: url,
        ).then((_) 
          async{
            userModel.coverUrl = url;
            userModel.coverImage = Image.file(image);
            setState(() {});
          }
        );
      }
      setState(() {});
    } on Exception catch(e) {
      errorDialog(context, 'Error', e.toString());
    }
  }

  _onChangeAvatar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: ClosePageIcon(), // Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('บัญชีผู้ใช้งาน'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileOptionsSettingPage()));
            },
          ),
          PopupMenuButton<String>(
            onSelected: menuAction,
            itemBuilder: (BuildContext context) {
              return PageMenus.menus.map((String menu) {
                return PopupMenuItem<String>(
                  value: menu,
                  child: (menu != PageMenus.divider) ? Text(menu) : PopupMenuDivider(),
                );
              }).toList();              
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(          
          children: <Widget>[
            Container(
              color: WholayColors.backgroundPrimary,
              child: UserProfileFullDisplay(
                pageTitle: 'บัญชีผู้ใช้งาน',
                showDisplayName: true,
                showMotto: true,
                showIconLevel: true,
                tabToEditName: true,
                backgroundHeight: WholaySpace.profileBackgroundHeight,
                userDisplayName: userModel.displayName,
                userMotto: userModel.motto,
                onSelectAvatar: (image) => _onSelectAvatar(image),
                onTakeAvatarPhoto: (image) => _onTakeAvatarPhoto(image),
                onSelectBackground: (image) => _onSelectBackground(image),
                onAfterChangeAvatar: () => _onChangeAvatar(),
              ),
            ),
            ListTileWithData(
              leadingIcon: CheckRightIcon(),
              title: 'E-Mail',
              data: userModel.email,  //  'thanaibox@gmail.com',
              showLowerDivide: true,
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => EmailVerifyPage()),
                );
              },
            ),
            ListTileWithData(
              leadingIcon: ErrorIcon(),
              title: 'หมายเลขโทรศัพท์',
              data: userModel.mobileNo, //'(66) 8X 123 4567',
              showLowerDivide: true,
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => MobileNoEntryPage()),
                );
              },
            ),
            ListTileFix(
              title: 'ตัวเลือกทักษะ',
              leadingIcon: Icon(Icons.build, size: WholaySpace.headIconSize, color: Colors.deepPurple[400]),
              showLowerDivide: true,
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SkillOptionsPage(visibleBackButton: true)),
                );
              },
            ),
            ListTileFix(
              title: 'รหัสผ่าน', 
              leadingIcon: Icon(Icons.lock, size: WholaySpace.headIconSize, color: Colors.purple[400]),
              showLowerDivide: true,
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => PasswordCorrectPage()),
                );
              },
            ),
            ListTileFix(
              title: 'ข้อมูลเอกสารสำคัญ / ที่อยู่',
              leadingIcon: WarningIcon(),
              showLowerDivide: true,
              onTap: () {
                Navigator.push(
                  context, 
                  // Check if user does not has register info., route to UserAcctRegistDetailEntryPage
                  // but if already exists, route to UserAcctRegistDetailSummaryPage.
                  MaterialPageRoute(builder: (context) => UserAcctRegistDetailEntryPage()),
                );
              },
            ),
            ListTileFix(
              title: 'ข้อมูลยืนยันตัวตน', 
              leadingIcon: WaitingIcon(),
              showLowerDivide: true,
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => UserAccountConfirmPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}