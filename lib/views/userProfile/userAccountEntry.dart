import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wholay/services/user_service.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/widgets/userProfile/skill_list_widget.dart';
import 'package:wholay/widgets/userProfile/userProfileWidget.dart';
import 'package:wholay/views/userProfile/skill_options.dart';
import 'package:wholay/constants/key.dart' as Local;
import 'package:wholay/main.dart';
import 'package:wholay/dialogs.dart';

class PageMenus {
  static const String saveMenu = 'บันทึกข้อมูล';
  static const String clearMenu = 'ล้างข้อมูล';
  static const String divider = '-';
  static const String selectBackgroundMenu = 'เลือกภาพพื้นหลัง';
  static const String selectAvatarMenu = 'เลือกรูปประจำตัว';
  static const String takePhotoMenu = 'เปิดกล้องถ่ายภาพ';

  static const List<String> menus = <String>[
    saveMenu,
    clearMenu,
    divider,
    selectBackgroundMenu,
    selectAvatarMenu,
    takePhotoMenu
  ];
}

class UserAcctEntryPage extends StatefulWidget {
  @override
  _UserAcctEntryPageState createState() => _UserAcctEntryPageState();
}

class _UserAcctEntryPageState extends State<UserAcctEntryPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final UserService _userService = UserService();

  String _userDisplayName;
  String _userMotto;
  String _avatarUrl = "";
  String _bgUrl = "";

  static final double _bottomBarHeight = 120.0;
  double _bottomHeight = _bottomBarHeight;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _pwController = TextEditingController();
  final _pwConfirmController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _mottoController = TextEditingController();
  final _scrollController = ScrollController();

  File _bgImg = null;
  File _avatarImg = null;

  bool _loading = false;

  @override
  void initState() {
    _displayNameController.addListener(() {
      setState(() {
        _userDisplayName = _displayNameController.text;
      });
    });

    _mottoController.addListener(() {
      setState(() {
        _userMotto = _mottoController.text;
      });
    });

    _scrollController.addListener(() {
      double _scrollHgt = _scrollController.position.maxScrollExtent -
          _scrollController.position.minScrollExtent;
      double _heightRatio = _scrollHgt / _bottomBarHeight;

      if ((_scrollController.offset >
              _scrollController.position.minScrollExtent) &&
          (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward)) {
        setState(() {
          _bottomHeight =
              _bottomHeight + (_scrollController.offset / _heightRatio);
          _bottomHeight = _bottomHeight > _bottomBarHeight
              ? _bottomBarHeight
              : _bottomHeight;
        });
      } else if ((_scrollController.offset >=
              _scrollController.position.minScrollExtent) &&
          (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse)) {
        setState(() {
          _bottomHeight =
              _bottomHeight - (_scrollController.offset / _heightRatio);
          _bottomHeight = _bottomHeight < 0 ? 0 : _bottomHeight;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNoController.dispose();
    _pwController.dispose();
    _pwConfirmController.dispose();
    _displayNameController.dispose();
    _mottoController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String _confirmPasswordValidate(String value) {
    if (_pwConfirmController.text != _pwController.text)
      return 'รหัสผ่านไม่ตรงกัน กรุณายืนยันรหัสผ่านอีกครั้ง';
    else
      return null;
  }

  void menuAction(String menu) {
    if (menu == PageMenus.clearMenu) {
      _mottoController.clear();
      _displayNameController.clear();
      _pwConfirmController.clear();
      _pwController.clear();
      _phoneNoController.clear();
      _emailController.clear();
    }
  }

  Future _uploadAvatarImage(String uid) async {
    try {
      final StorageUploadTask uploadTask =
          _storage.ref().child("avatar/${uid}").putFile(_avatarImg);
      final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
      final String url = (await downloadUrl.ref.getDownloadURL());
      setState(() {
        _avatarUrl = url;
        // userModel.userImage = Image.file(_avatarImg);
      });
    } on Exception catch (error) {
      print("[_uploadAvatarImage] ${error}");
    }
  }

  Future _uploadBgImage(String uid) async {
    try {
      final StorageUploadTask uploadTask =
          _storage.ref().child("cover/${uid}").putFile(_bgImg);
      final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
      final String url = (await downloadUrl.ref.getDownloadURL());
      setState(() {
        _bgUrl = url;
        // userModel.coverImage = Image.file(_bgImg);
      });
    } on Exception catch (error) {
      print("[_uploadBgImage] ${error}");
    }
  }

  _register(BuildContext context) {
    String _errMsg; // Added by Art.
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _loading = true;
      });

      _auth
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _pwController.text.trim())
          .then((user) async {
        if (_avatarImg != null) {
          await _uploadAvatarImage(user.uid);
          print("Avatar: $_avatarUrl");
        }

        if (_bgImg != null) {
          await _uploadBgImage(user.uid);
          print("Bg: $_bgUrl");
        }

        _userService
            .createOrUpdateProfile(
                uid: user.uid,
                mobileNo: _phoneNoController.text.trim(),
                displayName: _displayNameController.text.trim(),
                motto: _mottoController.text.trim(),
                avatarUrl: _avatarUrl,
                coverUrl: _bgUrl)
            .then((_) async {
          accessInfo.signupReady = true;

          await _secureStorage.write(key: Local.Key.USER_UID, value: user.uid);
          await _secureStorage.write(
              key: Local.Key.SIGNUPREADY,
              value: accessInfo.signupReady.toString());

          // setState(() {
          //   _loading = false;
          // });

          userModel.userId = user.uid;
          userModel.email = user.email;
          userModel.displayName = _displayNameController.text.trim();
          userModel.mobileNo = _phoneNoController.text.trim();
          userModel.motto = _mottoController.text.trim();
          userModel.coverUrl = _bgUrl;
          userModel.avatarUrl = _avatarUrl;
          userModel.coverImage = (_bgImg != null) ? Image.file(_bgImg) : null;
          userModel.userImage = (_avatarImg != null) ? Image.file(_avatarImg) : null;

          Navigator.popUntil(
            context,
            ModalRoute.withName('/'),
          );

          setState(() {
            _loading = false;
          });

          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => SkillOptionsPage(visibleBackButton: false)),
          );

        }).catchError((_) {
          setState(() {
            _loading = false;
          });
        });
      }).catchError((onError) {
        setState(() {
          _loading = false;
        });
        // print("[_register error] " + onError.toString());
        // Corrected by Art.
        _errMsg = onError.toString();
        // if (_errMsg.contains('ERROR_USER_NOT_FOUND'))
        //   _errMsg = 'ไม่พบผู้ใช้ "' + _emailController.text.trim() + '" ในระบบ';
        // else if (_errMsg.contains('ERROR_WRONG_PASSWORD'))
        //   _errMsg = 'รหัสผ่านไม่ถูกต้อง';
        errorDialog(context, 'Error', _errMsg);
        _formKey.currentState.reset();
      });
    }
  }

  _onSelectAvatar(File image) {
    setState(() {
      _avatarImg = image;
    });
  }

  _onTakeAvatarPhoto(File image) {
    setState(() {
      _avatarImg = image;
    });
  }

  _onSelectBackground(File image) {
    setState(() {
      _bgImg = image;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: ClosePageIcon(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('สร้างบัญชีใหม่'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              _register(context);
            },
          ),
          PopupMenuButton<String>(
            onSelected: menuAction,
            itemBuilder: (BuildContext context) {
              return PageMenus.menus.map((String menu) {
                return PopupMenuItem<String>(
                  value: menu,
                  child: (menu != PageMenus.divider)
                      ? Text(menu)
                      : PopupMenuDivider(),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ModalProgressHUD(
          child: SafeArea(
            child: ListView(
              controller: _scrollController,
              children: <Widget>[
                Container(
                  color: WholayColors.backgroundPrimary,
                  child: UserProfileFullDisplay(
                    pageTitle: 'สร้างบัญชีใหม่',
                    userDisplayName: _displayNameController.text.trim(),  //  _userDisplayName,
                    userMotto: _mottoController.text.trim(),  //  _userMotto,
                    showDisplayName: true,
                    showMotto: true,
                    showIconLevel: false,
                    userPicUri: _avatarUrl,
                    backgroundUri: _bgUrl,                    
                    onSelectAvatar: (image) => _onSelectAvatar(image),
                    onTakeAvatarPhoto: (image) => _onTakeAvatarPhoto(image),
                    onSelectBackground: (image) => _onSelectBackground(image),
                  ),
//              child: verticalSpace(250.0),
                ),
                verticalSpace(40.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        // emailInput(),
                        EmailInput(
                            controller: _emailController,
                            required: true,
                            onSaved: (value) {}
                        ),
                        verticalSpace(null),
                        PhoneNumberInput(
                          controller: _phoneNoController,
                        ),
                        verticalSpace(null),
                        // passwordConfirmInput(),
                        PasswordInput(
                          controller: _pwController,
                          required: true,
                          checkPattern: true,
                          labelText: 'รหัสผ่าน',
                          hintText: 'รหัสผ่านส่วนตัวของคุณ',
                        ),
                        verticalSpace(null),
                        PasswordInput(
                          controller: _pwConfirmController,
                          required: true,
                          checkPattern: false,
                          labelText: 'ยืนยันรหัสผ่าน',
                          hintText: 'ยืนยันรหัสผ่านส่วนตัวของคุณ',
                          validator: _confirmPasswordValidate,
                        ),
                        verticalSpace(25.0),
                        // userDisplayTextinput(),
                        UserDisplayNameInput(
                          requiredDisplayName: true,
                          requiredMotto: false,
                          displayNamecontroller: _displayNameController,
                          mottocontroller: _mottoController,
                        ),
                        // verticalSpace(25.0),
                        // ListTileFix(
                        //   title: 'กรุณาระบุทักษะที่คุณมี',
                        //   // leadingIcon: Icon(Icons.build, size: WholaySpace.headIconSize, color: Colors.deepPurple[400]),
                        //   showUpperDivide: true,
                        //   showLowerDivide: true,
                        //   onTap: () {
                        //     Navigator.push(
                        //       context, 
                        //       MaterialPageRoute(builder: (context) => SkillOptionsPage()),
                        //     );
                        //   },
                        // ),
                        // Expanded(child: SkillListWidget()),
                        // verticalSpace(25.0),

                        SaveFullWidthButton(
                          onPressed: () {
                            _register(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          inAsyncCall: _loading),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: _bottomHeight,
          color: WholayColors.primary,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
            child: Column(
              children: <Widget>[
                Spacer(),
                Text(
                  'สร้างด้วยบัญชี Social Network',
                  style: TextStyle(
                    fontFamily: WholayFonts.decoratedFontName,
                    color: WholayColors.textFader,
                    fontSize: 14.0,
                  ),
                ),
                Spacer(),
                SocialButtonBar(
                  buttonColor: Colors.white,
                  iconColor: WholayColors.primary,
                  backgroundColor: WholayColors.primary,
                  onPressedFacebook: () {},
                  onPressedGoogle: () {},
                  onPressedLine: () {},
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
      // bottomSheet: Container(
      //   height: 100.0,
      //   color: WholayColors.primary,
      // ),
    );
  }
}
