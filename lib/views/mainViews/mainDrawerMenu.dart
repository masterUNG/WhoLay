import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wholay/services/user_service.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wholay/widgets/userProfile/userProfileWidget.dart';
import 'package:wholay/views/userProfile/userAccountSummary.dart';
import 'package:wholay/views/servantProfiles/myServiceMain.dart';
import 'package:wholay/main.dart';

class MainDrawerMenuPage extends StatefulWidget {
  @override
  _MainDrawerMenuPageState createState() => _MainDrawerMenuPageState();
}

class _MainDrawerMenuPageState extends State<MainDrawerMenuPage> {
  final FlutterSecureStorage _secureStorage = new FlutterSecureStorage();
  final UserService _userService = UserService();

  String _displayName;
  String _motto;
  String _avatarUrl;
  String _bgUrl;
  int _level;

  TextStyle _textMenuStyle = TextStyle(
      fontFamily: WholayFonts.decoratedFontName,
      color: Colors.white,
      fontWeight: FontWeight.normal);

  @override
  void initState() {
    super.initState();
    if ((userModel.userId != null) && ((userModel.userImage == null) || (userModel.coverImage == null))) {
      _userService.myProfile().then((profile) {
        setState(() {
          _avatarUrl = profile['avatarUrl'];
          _bgUrl = profile['coverUrl'];
          if ((_bgUrl != null) && (_bgUrl.trim().isNotEmpty) && (userModel.coverImage == null))
            userModel.coverImage = Image.network(_bgUrl);
          if ((_avatarUrl != null) && (_avatarUrl.trim().isNotEmpty) && (userModel.userImage == null))
            userModel.userImage = Image.network(_avatarUrl);
        });
      });
    }
   
  }

 

  void _logout(context) async {
    await _secureStorage.deleteAll();
    userModel.clearUserProfile();
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      color: WholayColors.blue[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserProfileFullDisplay(
            userDisplayName: _displayName,
            userMotto: _motto,
            userPicUri: _avatarUrl,
            userLevel: _level,
            backgroundUri: _bgUrl,
            showDisplayName: true,
            showMotto: true,
            showIconLevel: true,
            tabToEditName: false,
            canChangeAvartar: false,
            canChangeBackground: false,
            canDisplayAvatarOnAnotherView: false,
            backgroundHeight: 360,
            avatarRadius: 100,
            avatarTopSpace: 20.0,            
            fillBackgroundType: FillBackgroudType.FillBoth,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0.0),
              children: <Widget>[
                ListTileWithData(
                  title: 'บริการของฉัน',
                  headerTextStyle: _textMenuStyle,
                  leadingIcon: Icon(Icons.work, color: Colors.white, size: 28.0),
                  showLowerDivide: true,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyServiceMainPage())
                    );
                  },
                ),
                ListTileWithData(
                  title: 'ประวัติการซื้อขาย',
                  headerTextStyle: _textMenuStyle,
                  leadingIcon: Icon(Icons.access_time, color: Colors.white, size: 30.0),
                  showLowerDivide: true,
                  onTap: () {},
                ),
                ListTileWithData(
                  title: 'บัญชีผู้ใช้งาน',
                  headerTextStyle: _textMenuStyle,
                  leadingIcon: Icon(Icons.person, color: Colors.white, size: 30.0),
                  showLowerDivide: true,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserAccountSummaryPage())
                    );
                  },
                ),
                ListTileWithData(
                  title: 'ตั้งค่าระบบ',
                  headerTextStyle: _textMenuStyle,
                  leadingIcon: Icon(Icons.settings, color: Colors.white, size: 28.0),
                  showLowerDivide: true,
                  onTap: () {},
                ),
                ListTileWithData(
                  title: 'คู่มือการใช้งาน',
                  headerTextStyle: _textMenuStyle,
                  leadingIcon: Icon(FontAwesomeIcons.book, color: Colors.white),
                  showLowerDivide: true,
                  onTap: () {},
                ),
                ListTileWithData(
                  title: 'คำถามที่ถามบ่อย (FAQ)',
                  headerTextStyle: _textMenuStyle,
                  leadingIcon: Icon(Icons.live_help, color: Colors.white, size: 28.0),
                  showLowerDivide: true,
                  onTap: () {},
                ),
                ListTileWithData(
                  title: 'ข้อตกลงการใช้งาน',
                  headerTextStyle: _textMenuStyle,
                  leadingIcon: Icon(FontAwesomeIcons.fileSignature, color: Colors.white),
                  showLowerDivide: true,
                  onTap: () {},
                ),
                ListTileWithData(
                  title: 'ออกจากระบบ',
                  headerTextStyle: _textMenuStyle,
                  leadingIcon: Icon(FontAwesomeIcons.doorOpen, color: Colors.white),
                  showLowerDivide: true,
                  onTap: () => _logout(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
