import 'dart:io';
import 'package:wholay/main.dart';
import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/dialogs.dart';
import 'package:wholay/services/user_service.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:wholay/views/userProfile/displayNameEntry.dart';
import 'package:wholay/models/userAccount_model.dart';
// import 'package:photo_view/photo_view.dart';
import 'package:date_format/date_format.dart';

enum FillBackgroudType { FillWidth, FillHeight, FillBoth }

enum ModelAction {ModelActionClose, ModelActionOK}

class PictureDisplayCallback {
  Image picture;
  File  pictureFile;
  ModelAction modelAction;

  PictureDisplayCallback({
    this.picture,
    this.pictureFile,
    this.modelAction = ModelAction.ModelActionClose
  });
}

class UserProfileFullDisplay extends StatefulWidget {

  const UserProfileFullDisplay({
    Key key,
    this.pageTitle,
    this.backgroundUri,
    this.userPicUri,
    this.userDisplayName,
    this.userMotto,
    this.backgroundHeight,
    this.backgroundOpacity = 1.0,
    this.avatarRadius,
    this.avatarTopSpace = 0.0,
    this.tabToEditName = false,
    this.showDisplayName = true,
    this.showMotto = true,
    this.showIconLevel = false,
    this.showMemberDate = false,
    this.userLevel = 1,
    this.canChangeAvartar = true,
    this.canChangeBackground = true,
    this.canDisplayAvatarOnAnotherView = true,
    this.fillBackgroundType = FillBackgroudType.FillWidth,
    this.onSelectBackground,
    this.onSelectAvatar,
    this.onTakeAvatarPhoto,
    this.onAfterChangeAvatar
  }) : super(key: key);

  final String  pageTitle;
  final String  backgroundUri;
  final String  userPicUri;
  final String  userDisplayName;
  final String  userMotto;
  final double  backgroundHeight;
  final double  backgroundOpacity;
  final double  avatarRadius;
  final double  avatarTopSpace;
  final bool    tabToEditName;
  final bool    showDisplayName;
  final bool    showMotto;
  final bool    showIconLevel;
  final bool    showMemberDate;
  final int     userLevel;
  final bool    canChangeAvartar;
  final bool    canChangeBackground;
  final bool    canDisplayAvatarOnAnotherView;
  final FillBackgroudType fillBackgroundType;
  final ValueSetter<File> onSelectBackground;
  final ValueSetter<File> onSelectAvatar;
  final ValueSetter<File> onTakeAvatarPhoto;
  final VoidCallback onAfterChangeAvatar;

  @override
  _UserProfileFullDisplayState createState() => _UserProfileFullDisplayState();
}

class _UserProfileFullDisplayState extends State<UserProfileFullDisplay> {
  Image _bgImg = null;
  Image _avatarImg = null;
  PictureDisplayCallback _userImgCallback = PictureDisplayCallback();

  @override
  Widget build(BuildContext context) {
    double _bgHeight =
        (widget.backgroundHeight == null) || (widget.backgroundHeight == 0)
            ? 300.0
            : widget.backgroundHeight;
    String _displayName = widget.userDisplayName;
    double _avatarRadius = (widget.avatarRadius) ?? _bgHeight / 3.5;
    double _nameFontSize;
    double _mottoFontSize;
    double _screenWdt;

      // if (userModel.coverImage != null)
      //   _bgImg = userModel.coverImage;
      // else if ((widget.backgroundUri == null) ||
      //     (widget.backgroundUri.trim().isEmpty))
      //   _bgImg = Image.asset('imgs/profiles/profileBg.png');
      // else
      //   _bgImg = Image.network(widget.backgroundUri);

      if (_bgImg == null) {
        if (userModel.coverImage != null)
          _bgImg = userModel.coverImage;
        else if ((widget.backgroundUri != null) && (widget.backgroundUri.trim().isNotEmpty))
          _bgImg = Image.network(widget.backgroundUri);
        else
          _bgImg = Image.asset('imgs/profiles/profileBg.png');
      }

    // if (_avatarImg == null) {
      if (userModel.userImage != null)
        _avatarImg = userModel.userImage;
      if ((widget.userPicUri != null) && (widget.userPicUri.trim().isNotEmpty))
        _avatarImg = Image.network(widget.userPicUri);
      // if (_userImgCallback.picture != null)
      //   _avatarImg = _userImgCallback.picture;
    // }

    if (_bgHeight < 250.0) {
      _nameFontSize = _bgHeight / 15.0;
      _mottoFontSize = _bgHeight / 18.0;
    }

    _screenWdt = MediaQuery.of(context).size.width;
    _userImgCallback.picture = _avatarImg;
    if (_userImgCallback.modelAction == null)
      _userImgCallback.modelAction = ModelAction.ModelActionClose;

    Future getAvatarCamera() async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _avatarImg = Image.file(image);
          widget.onTakeAvatarPhoto(image);
        });
      }
    }

    Future selectAvatarImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _avatarImg = Image.file(image);
          widget.onSelectAvatar(image);
        });
      }
    }

    Future selectBackgroundImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _bgImg = Image.file(image);
          widget.onSelectBackground(image);
        });
      }
    }

    _openUserImageDisplayPage() async {
      final _picCallbackEdit = await Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => PictureDisplayPage(
            pageTitle: 'รูปของ ' + widget.userDisplayName ?? '',
            displayCallback: _userImgCallback,
            canEditImage: widget.canChangeAvartar,
            canSelectGallery: widget.canChangeAvartar,
            canTakePhoto: widget.canChangeAvartar,
          )
        )
      ) as PictureDisplayCallback;

      if ((_picCallbackEdit != null) && (_picCallbackEdit.modelAction == ModelAction.ModelActionOK)) {
        try {
          _userImgCallback.picture = _picCallbackEdit.picture;
          File imgFile = _picCallbackEdit.pictureFile;
          // widget.onSelectAvatar(imgFile);
          setState(() {
            userModel.userImage = _picCallbackEdit.picture;
            _avatarImg = _picCallbackEdit.picture;
          });
          // widget.onAfterChangeAvatar();
          widget.onSelectAvatar(imgFile);
        } catch(e) {
          errorDialog(context, 'Error', e.toString());
        }
      }

    }

    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Opacity(
          opacity: widget.backgroundOpacity,
          child: Image(
            height: _bgHeight,
            width: double.maxFinite,
            fit: (widget.fillBackgroundType == null ||
                    widget.fillBackgroundType == FillBackgroudType.FillWidth)
                ? BoxFit.fitWidth
                : ((widget.fillBackgroundType == FillBackgroudType.FillHeight)
                    ? BoxFit.fitHeight
                    : BoxFit.fill),
            image: _bgImg.image,
          ),
        ),
        Center(
          child: UserAvatar(
//            avatarUri: widget.userPicUri,
            pageTitle: widget.pageTitle,
            avatarImage: _avatarImg,
            avatarRadius: _avatarRadius,
            topSpace: widget.avatarTopSpace,
            displayName: _displayName,  // userModel.displayName,
            motto: widget.userMotto,  // userModel.motto,
            nameFontSize: _nameFontSize,
            mottoFontSize: _mottoFontSize,
            tabToEditName: widget.tabToEditName,
            showDisplayName: widget.showDisplayName,
            showMotto: widget.showMotto,
            showIconLevel: widget.showIconLevel,
            showMemberDate: widget.showMemberDate,
            userLevel: widget.userLevel,
            onTap: () {
              if (userModel.userImage != null) {
                if (widget.canDisplayAvatarOnAnotherView)
                  _openUserImageDisplayPage();
              } else if (widget.canChangeAvartar)
                selectAvatarImage();
            },
          ),
        ),
        Positioned(
          // Camera
          left: ((_screenWdt + _avatarRadius) / 2) + 14.0,
          top: 26.0,
          child: Visibility(
            visible: widget.canChangeAvartar,
            child: CircleIconButton(
              icon: Icon(Icons.camera_alt, size: 20.0),
              iconColor: Colors.white,
              radius: 18.0,
              showShadow: true,
              shadowColor: Colors.white70,
              shadowRadius: 6.0,
              onPressed: () {
                if (widget.canChangeAvartar) getAvatarCamera();
              },
            ),
          ),
        ),
        Positioned(
          // Select Picture
          left: _screenWdt - 55,
          top: _bgHeight - 55,
          child: Visibility(
            visible: widget.canChangeBackground,
            child: CircleIconButton(
              icon: Icon(Icons.photo_size_select_actual, size: 20.0),
              iconColor: Colors.white,
              radius: 18.0,
              showShadow: true,
              shadowColor: Colors.white70,
              shadowRadius: 6.0,
              //shadowOffset: 2.0,
              onPressed: () {
                if (widget.canChangeBackground) selectBackgroundImage();
              },
            ),
          ),
        ),
      ],
    );
  }
}

enum AvatarPosition {Left, Top, Right, Bottom}

class UserAvatar extends StatefulWidget {
  UserAvatar({
      Key key,
//    this.avatarUri,
      this.pageTitle,
      this.avatarImage,
      this.avatarPosition = AvatarPosition.Top,
      this.avatarGap = 8.0,
      this.displayName,
      this.motto,
      this.userLevel = 1,
      this.memberDate,
      this.topSpace = 0.0,
      this.avatarRadius,
      this.nameFontSize,
      this.mottoFontSize,
      this.scoreFontSize,
      this.levelFontSize,
      this.levelIconSize,
      this.memberDateFontSize,
      this.nameLimitedWidth = 0.0,
      this.mottoLimitedWidth = 0.0,
      this.levelLimitedWidth = 0.0,
      this.memberDateLimitedWidth = 0.0,
      this.nameFontColor,
      this.mottoFontColor,
      this.levelFontColor,
      this.scoreFontColor,
      this.memberDateFontColor,
      this.showAvatarBorder = true,
      this.showShadowName = true,
      this.showShadowMotto = true,
      this.showShadowLevel = true,
      this.showShadowScore = true,
      this.showShadowMemberDate = true,
      this.showDisplayName = true,
      this.showMotto = true,
      this.showIconLevel = false,
      this.showMemberDate = false,
      this.tabToEditName = false,
      this.showScore = false,
      this.scoreValue = 0,
      this.scoreIconSize,
      this.onTap
  }) : super(key: key);

//  final String avatarUri;
  final String pageTitle;
  final Image avatarImage;
  final AvatarPosition avatarPosition;
  final double avatarGap;
  final String displayName;
  final String motto;
  final int userLevel;
  final DateTime memberDate;
  final double topSpace;
  final double avatarRadius;
  final double nameFontSize;
  final double mottoFontSize;
  final double scoreFontSize;
  final double levelFontSize;
  final double levelIconSize;
  final double memberDateFontSize;
  final double nameLimitedWidth;
  final double mottoLimitedWidth;
  final double levelLimitedWidth;
  final double memberDateLimitedWidth;
  final Color nameFontColor;
  final Color mottoFontColor;
  final Color levelFontColor;
  final Color scoreFontColor;
  final Color memberDateFontColor;
  final bool showAvatarBorder;
  final bool showShadowName;
  final bool showShadowMotto;
  final bool showShadowLevel;
  final bool showShadowScore;
  final bool showShadowMemberDate;
  final bool showDisplayName;
  final bool showMotto;
  final bool showIconLevel;
  final bool showMemberDate;
  final bool tabToEditName;
  final bool showScore;
  final int scoreValue;
  final double scoreIconSize;
  final GestureTapCallback onTap;

  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  Image _usrImg;
  UserAccountModel _userModel = UserAccountModel();
  final UserService _userService = UserService();
  static const String _defDisplayName = 'ชื่อแสดง';
  static const String _defMotto = 'คำประจำตัว';
  
  @override
  Widget build(BuildContext context) {

    String _displayName =
        (widget.displayName == null) || (widget.displayName.trim().isEmpty)
            ? _defDisplayName
            : widget.displayName;
    String _motto = (widget.motto == null) || (widget.motto.trim().isEmpty)
        ? _defMotto
        : widget.motto;
    double _avatarRadius =
        (widget.avatarRadius == null) || (widget.avatarRadius == 0)
            ? 80.0
            : widget.avatarRadius;
    double _nameFontSize =
        (widget.nameFontSize == null) || (widget.nameFontSize == 0)
            ? 18.0
            : widget.nameFontSize;
    double _mottoFontSize =
        (widget.mottoFontSize == null) || (widget.mottoFontSize == 0)
            ? 15.0
            : widget.mottoFontSize;
    double _levelFontSize =
        (widget.levelFontSize == null) || (widget.levelFontSize == 0)
            ? 15.0
            : widget.levelFontSize;
    double _scoreFontSize =
        (widget.scoreFontSize == null) || (widget.scoreFontSize == 0)
            ? 13.0
            : widget.scoreFontSize;
    double _memberDateFontSize =
        (widget.memberDateFontSize == null) || (widget.memberDateFontSize == 0)
            ? 12.0
            : widget.memberDateFontSize;
    double _vSpace =
        (widget.showDisplayName || widget.showMotto || widget.showMotto)
            ? (widget.avatarGap ?? 8.0)
            : 0.0;
    // Color _levelActiveColor = Colors.pinkAccent[400];
    // Color _levelInactiveColor = Colors.grey[400];
    double _levelSpace = 0.0;
    double _scoreIconSize = (widget.scoreIconSize ?? IconTheme.of(context).size);
    // final _widgetSize = _globalKey.currentContext.size;

    _userModel.displayName =
        (_displayName == _defDisplayName) ? null : _displayName;
    _userModel.motto = (_motto == _defMotto) ? null : _motto;
    int _userLevel = (widget.userLevel) ?? 1;

    _usrImg = widget.avatarImage;
    if (_usrImg == null) _usrImg = Image.asset('imgs/profiles/userImg.png');

    if (widget.showIconLevel) {
      if (widget.showDisplayName || widget.showMotto)
        _levelSpace = 4.0;
      else
        _levelSpace = 12.0;
    }

    _openDisplayNameEditPage() async {
      final _userModelEdit = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DisplayNameEntryPage(
                  pageTitle: widget.pageTitle,
                  userModel: _userModel))) as UserAccountModel;

      if (_userModelEdit != null) {

        _userModel.displayName = _userModelEdit.displayName;
        _userModel.motto = _userModelEdit.motto;

        try {
          if (userModel.userId != null)
            _userService.createOrUpdateProfile(
              uid: userModel.userId,
              displayName: _userModel.displayName,
              motto: _userModel.motto,
              mobileNo: userModel.mobileNo,
              avatarUrl: userModel.avatarUrl,
              coverUrl: userModel.coverUrl,
            ).then((_) 
              async{
                userModel.displayName = _userModel.displayName;
                userModel.motto = _userModel.motto;

                // Navigator.pop(context);

                setState(() {
                  _displayName = _userModel.displayName;
                  _motto = _userModel.motto;
                });
              }
            );
        } catch (e) {
          errorDialog(context, 'Error', e.toString());
        }

      }
    }

    Widget _userScoreWidget() {
      return Visibility(
        visible: (widget.scoreValue > 0) && (widget.showScore),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.favorite, color: Colors.red, size: _scoreIconSize),
            horizontalSpace(3.0),
            Text('${widget.scoreValue ?? 0}', 
              style: TextStyle(
                fontFamily: WholayFonts.decoratedFontName,
                fontSize: _scoreFontSize,
                fontWeight: FontWeight.normal,
                color: widget.scoreFontColor ?? Colors.white,
                shadows: widget.showShadowScore 
                ? <Shadow>[
                  Shadow(
                    color: Colors.black,
                    blurRadius: 3.0,
                  )
                ] : null,
              ),
            ),
          ],
        ),
      );
    }

    Widget _avatarCircle() {
      return Column(
        children: <Widget>[
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: _avatarRadius * 2,
              height: _avatarRadius * 2,
              decoration: BoxDecoration(
                color: WholayColors.backgroundPrimary,
                shape: BoxShape.circle,
                border: (widget.showAvatarBorder) ? Border.all(color: Colors.white, width: 2.0) : null,
                image: DecorationImage(
                  image: _usrImg.image, 
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          verticalSpace(4.0),
          _userScoreWidget(),
        ],
      );
    }

    Widget _displayNameLabel() {
      return Visibility(
        visible: widget.showDisplayName,
        child: GestureDetector(
          onTap: () {
            if (widget.tabToEditName) _openDisplayNameEditPage();
          },
          child: Container(
            constraints: BoxConstraints(maxWidth: ((widget.nameLimitedWidth ?? 0.0) > 0.0) ? widget.nameLimitedWidth : double.maxFinite),
            child: Text(
              _displayName,
              softWrap: false,
              overflow: TextOverflow.ellipsis,            
              maxLines: 1,
              style: TextStyle(
                fontFamily: WholayFonts.decoratedFontName,
                fontSize: _nameFontSize,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
                color: widget.nameFontColor ?? Colors.white,
                shadows: widget.showShadowName 
                ? <Shadow>[
                  Shadow(
                    color: Colors.black87,
                    blurRadius: 6.0,
                  )
                ] : null,
              ),
            ),
          ),                  
        ),
      );
    }

    Widget _mottoLabel() {
      return Visibility(
        visible: widget.showMotto,
        child: GestureDetector(
          onTap: () {
            if (widget.tabToEditName) _openDisplayNameEditPage();
          },
          child: Container(
            constraints: BoxConstraints(maxWidth: ((widget.mottoLimitedWidth ?? 0.0) > 0.0) ? widget.mottoLimitedWidth : double.maxFinite),
            child: Text(
              _motto,
              softWrap: false,
              overflow: TextOverflow.ellipsis,            
              maxLines: 1,
              style: TextStyle(
                fontFamily: WholayFonts.decoratedFontName,
                fontSize: _mottoFontSize,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.0,
                color: widget.mottoFontColor ?? Colors.white,
                shadows: widget.showShadowMotto 
                ? <Shadow>[
                  Shadow(
                    color: Colors.black87,
                    blurRadius: 6.0,
                  )
                ] : null,
              ),
            ),
          ),
        ),
      );
    }

    Widget _userLevelWidget() {
      return Visibility(
        visible: widget.showIconLevel,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              EvaIcons.checkmarkCircle2,
              color: (_userLevel == 1) ? Colors.amberAccent 
                   : (_userLevel == 2) ? Colors.orange
                   : (_userLevel == 3) ? Colors.lightBlue
                   : Colors.green,
              size: (widget.levelIconSize) ?? IconTheme.of(context).size,
            ),
            horizontalSpace(6.0),
            Container(
              constraints: BoxConstraints(maxWidth: ((widget.levelLimitedWidth ?? 0.0) > 0.0) ? widget.levelLimitedWidth : double.maxFinite),
              child: Text(
                (_userLevel == 1) ? 'สมาชิกทั่วไป' :
                (_userLevel == 2) ? 'ยืนยันข้อมูลติดต่อ' :
                (_userLevel == 3) ? 'ยืนยันเลข ID' : 'ยืนยันเอกสารครบ',
                softWrap: false,
                overflow: TextOverflow.ellipsis,            
                maxLines: 1,
                style: TextStyle(
                  fontFamily: WholayFonts.decoratedFontName,
                  fontSize: _levelFontSize,
                  fontWeight: FontWeight.normal,
                  color: widget.levelFontColor ?? Colors.white,
                  shadows: widget.showShadowLevel 
                  ? <Shadow>[
                    Shadow(
                      color: Colors.black87,
                      blurRadius: 4.0,
                    )
                  ] : null,
                ),
              ),
            ),
            // Icon(EvaIcons.award,
            //     color: (_userLevel >= 1)
            //         ? _levelActiveColor
            //         : _levelInactiveColor,
            //     size: (widget.levelIconSize) ?? IconTheme.of(context).size,
            // ),
            // Icon(EvaIcons.award,
            //     color: (_userLevel >= 2)
            //         ? _levelActiveColor
            //         : _levelInactiveColor,
            //     size: (widget.levelIconSize) ?? IconTheme.of(context).size,
            // ),
            // Icon(EvaIcons.award,
            //     color: (_userLevel >= 3)
            //         ? _levelActiveColor
            //         : _levelInactiveColor,
            //     size: (widget.levelIconSize) ?? IconTheme.of(context).size,
            // ),
            // Icon(EvaIcons.award,
            //     color: (_userLevel >= 4)
            //         ? _levelActiveColor
            //         : _levelInactiveColor,
            //     size: (widget.levelIconSize) ?? IconTheme.of(context).size,
            // ),
          ],
        ),
      );
    }

    Widget _memberDateWidget() {
      return Visibility(
        visible: widget.showMemberDate && (widget.memberDate != null),
        child: Container(
          constraints: BoxConstraints(maxWidth: ((widget.memberDateLimitedWidth ?? 0.0) > 0.0) ? widget.memberDateLimitedWidth : double.maxFinite),
          child: Text(
            'วันที่สมัคร ' + formatDate(widget.memberDate ?? DateTime.now(), [d, '/', mm, '/', yyyy]),
            softWrap: false,
            overflow: TextOverflow.ellipsis,            
            maxLines: 1,
            style: TextStyle(
              fontFamily: WholayFonts.decoratedFontName,
              fontSize: _memberDateFontSize,
              fontWeight: FontWeight.normal,
              color: widget.memberDateFontColor ?? Colors.white,
              shadows: widget.showShadowMemberDate 
              ? <Shadow>[
                Shadow(
                  color: Colors.black87,
                  blurRadius: 4.0,
                )
              ] : null,
            ),
          ),
        ),
      );
    }

    return (widget.avatarPosition == AvatarPosition.Top) 
    ? Column(
        children: <Widget>[
          verticalSpace(widget.topSpace ?? 0.0),
          _avatarCircle(),
          verticalSpace(_vSpace),
          _displayNameLabel(),
          _mottoLabel(),
          verticalSpace(_levelSpace),
          _userLevelWidget(),
          _memberDateWidget(),
        ],
      )
    : (widget.avatarPosition == AvatarPosition.Bottom) 
    ? Column(
        children: <Widget>[
          verticalSpace(widget.topSpace ?? 0.0),
          _displayNameLabel(),
          _mottoLabel(),
          verticalSpace(_levelSpace),
          _userLevelWidget(),
          _memberDateWidget(),
          verticalSpace(_vSpace),
          _avatarCircle(),
        ],
      )
    : (widget.avatarPosition == AvatarPosition.Left) 
    ? Padding(
        padding: EdgeInsets.only(top: widget.topSpace ?? 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _avatarCircle(),
            horizontalSpace(_vSpace),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _displayNameLabel(),
                _mottoLabel(),
                verticalSpace(_levelSpace),
                _userLevelWidget(),
                _memberDateWidget(),
              ],
            ),
          ],
        ),
      )      
    : (widget.avatarPosition == AvatarPosition.Right)
    ? Padding(
        padding: EdgeInsets.only(top: widget.topSpace ?? 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _displayNameLabel(),
                _mottoLabel(),
                verticalSpace(_levelSpace),
                _userLevelWidget(),
                _memberDateWidget(),
              ],
            ),
            horizontalSpace(_vSpace),
            _avatarCircle(),
          ],
        ),
      )
    : _avatarCircle();
  }
}

class PictureDisplayPage extends StatefulWidget {

  PictureDisplayPage({
    Key key,
    this.pageTitle,
    @required this.displayCallback,
    this.canSelectGallery = true,
    this.canTakePhoto = true,
    this.canEditImage = false,
  }) : super(key: key);

  final String pageTitle;
  final PictureDisplayCallback displayCallback;
  final bool canSelectGallery;
  final bool canTakePhoto;
  final bool canEditImage;

  @override
  _PictureDisplayPageState createState() => _PictureDisplayPageState();
}

class _PictureDisplayPageState extends State<PictureDisplayPage> {

  Image _picImage;

  @override
  Widget build(BuildContext context) {

    if (_picImage == null)
      _picImage = widget.displayCallback.picture;

    if (widget.displayCallback.modelAction == null)
      widget.displayCallback.modelAction = ModelAction.ModelActionClose;

    Future getPicFromCamera() async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        widget.displayCallback.pictureFile = image;
        widget.displayCallback.picture = Image.file(image);
        setState(() {
          _picImage = Image.file(image);
        });
      }
    }

    Future getPicFromGallery() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        widget.displayCallback.pictureFile = image;
        widget.displayCallback.picture = Image.file(image);
        setState(() {
          _picImage = Image.file(image);
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: ClosePageIcon(), // Icon(Icons.arrow_back),
          onPressed: () {
            widget.displayCallback.modelAction = ModelAction.ModelActionClose;
            Navigator.pop(context, widget.displayCallback);
          },
        ),
        title: Text(widget.pageTitle),
        actions: <Widget>[
          Visibility(
            visible: widget.canEditImage,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
              },
            ),
          ),
          Visibility(
            visible: widget.canTakePhoto,
            child: IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                getPicFromCamera();
              },
            ),
          ),
          Visibility(
            visible: widget.canSelectGallery,
            child: IconButton(
              icon: Icon(Icons.photo_size_select_actual),
              onPressed: () {
                getPicFromGallery();
              },
            ),
          ),
          Visibility(
            visible: widget.canEditImage || widget.canTakePhoto || widget.canSelectGallery,
            child: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                widget.displayCallback.modelAction = ModelAction.ModelActionOK;
                Navigator.pop(context, widget.displayCallback);
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          // child: PhotoView(
          //   imageProvider: _picImage.image,
          //   minScale: 0.1,
          //   maxScale: 3.0,
          //   backgroundDecoration: BoxDecoration(
          //     color: Colors.black
          //   ),
          // ),
          // decoration: BoxDecoration(
          //   color: Colors.black,
          //   shape: BoxShape.rectangle,
          //   image: DecorationImage(
          //     image: widget.avatarImage.image, 
          //     fit: BoxFit.contain
          //   )
          // ),
        ),
      ),      
    );
  }
}