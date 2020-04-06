import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/widgets/userProfile/userProfileWidget.dart';
import 'package:date_format/date_format.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileFullInfoDisplay extends StatefulWidget {

  final String    userDisplayName;
  final String    userMotto;
  final String    userAvatarUri;
  final String    userBackgrounUri;
  final int       userLevel;
  final bool      showEmail;
  final String    email;
  final bool      showMobileNo;
  final String    mobileNo;
  final bool      showFullName;
  final String    fullName;
  final bool      showGender;
  final String    gender;
  final bool      showRace;
  final String    race;
  final bool      showNationality;
  final String    nationality;
  final bool      showReligion;
  final String    religion;
  final bool      showBirthdate;
  final bool      showAge;
  final DateTime  birthdate;
  final String    birthdateFormat;
  final bool      showAmphor;
  final String    amphor;
  final bool      showProvince;
  final String    province;
  final bool      showCountry;
  final String    country;
  final bool      showTitleBar;
  final String    titleBarText;
  final bool      visibleFollowButton;

  UserProfileFullInfoDisplay({
    Key key,
    this.userDisplayName,
    this.userMotto,
    this.userAvatarUri,
    this.userBackgrounUri,
    this.userLevel,
    this.showEmail = false,
    this.email,
    this.showMobileNo = false,
    this.mobileNo,
    this.showFullName = true,
    this.fullName,
    this.showGender = true,
    this.gender,
    this.showRace = true,
    this.race,
    this.showNationality = true,
    this.nationality,
    this.showReligion = true,
    this.religion,
    this.showBirthdate = true,
    this.showAge = true,
    this.birthdate,
    this.birthdateFormat = 'MY',  // -- Y, MY, DMY
    this.showAmphor = false,
    this.amphor,
    this.showProvince = true,
    this.province,
    this.showCountry = true,
    this.country,
    this.showTitleBar = false,
    this.titleBarText = '',
    this.visibleFollowButton = false,
  }) : super(key: key);  

  @override
  _UserProfileFullInfoDisplayState createState() => _UserProfileFullInfoDisplayState();
}

class _UserProfileFullInfoDisplayState extends State<UserProfileFullInfoDisplay> {
  @override
  Widget build(BuildContext context) {    

    String _nameInfoGroupTitle() {
      return widget.showFullName ? (widget.showGender ? 'ชื่อ-นามสกุล, เพศ' : 'ชื่อ-นามสกุล') : (widget.showGender ? 'เพศ' : '');
    }

    String _nameInfoGroupData() {
      return widget.showFullName 
                  ? (widget.showGender ? (widget.fullName ?? '') + (((widget.fullName != null) && (widget.gender != null)) ? ', ' : '') + (widget.gender ?? '') : widget.fullName)
                  : (widget.showGender ? widget.gender : '');
    }

    String _raceInfoGroupTitle() {

      String _result = '';

      if (widget.showRace)
        _result = 'เชื้อชาติ';
      if (widget.showNationality)
        if (widget.showRace)
          _result = _result + ', ' + 'สัญชาติ';
        else
          _result = 'สัญชาติ';
      if (widget.showReligion)
        if (_result.trim().isNotEmpty)
          _result = _result + ', ' + 'ศาสนา';
        else
          _result = 'ศาสนา';

      return _result;          
    }

    String _raceInfoGroupData() {

      String _result = '';

      if ((widget.showRace) && (widget.race != null))
        _result = widget.race;
      if ((widget.showNationality) && (widget.nationality != null))
        if (_result.trim().isNotEmpty)
          _result = _result + ', ' + widget.nationality;
        else
          _result = widget.nationality;
      if ((widget.showReligion) && (widget.religion != null))
        if (_result.trim().isNotEmpty)
          _result = _result + ', ' + widget.religion;
        else
          _result = widget.religion;

      return _result;          
    }

    int _calcAge(DateTime birthdate) {
      var age = DateTime.now().year - birthdate.year;
      var nowDay = DateTime.now().day;
      var nowMonth = DateTime.now().month;
      var birthDay = birthdate.day;
      var birthMonth = birthdate.month;

      if ((nowMonth < birthMonth) || ((nowMonth == birthMonth) && (nowDay < birthDay))) age--;

      return age;
    }

    String _birthInfoGroupTitle() {
      return widget.showBirthdate ? (widget.showAge ? 'วันเกิด, อายุ' : 'วันเกิด') : (widget.showAge ? 'อายุ' : '');
    }

    String _birthInfoGroupData() {
      String _result = '';
      List<String> _dFmt;

      if (widget.birthdateFormat == 'Y') _dFmt = [yyyy];
      else if (widget.birthdateFormat == 'MY') _dFmt = [MM, ' ', yyyy];
      else if (widget.birthdateFormat == 'DMY') _dFmt = [d, ' ', MM, ' ', yyyy];

      if ((widget.showBirthdate) && (widget.birthdateFormat != null) && (widget.birthdate != null))
        _result = formatDate(widget.birthdate, _dFmt);
      if ((widget.showAge) && (widget.birthdate != null)) {
        var _age = _calcAge(widget.birthdate);
        if (_result.trim().isNotEmpty)
          _result = _result + ', ' + _age.toString() + ' ปี';
        else
          _result = _age.toString() + ' ปี';
      }

      return _result;
    }

    String _addressGroupData() {

      String _result = '';

      if ((widget.showAmphor) && (widget.amphor != null))
        _result = widget.amphor;
      if ((widget.showProvince) && (widget.province != null))
        if (_result.trim().isNotEmpty)
          _result = _result + ', ' + widget.province;
        else
          _result = widget.province;
      if ((widget.showCountry) && (widget.country != null))
        if (_result.trim().isNotEmpty)
          _result = _result + ', ' + widget.country;
        else
          _result = widget.country;

      return _result;          
    }

    return OrientationBuilder(
      builder: (context, orientation) {
        if ((orientation == Orientation.portrait) || (orientation == Orientation.landscape)) { // implement in next phase.
          return Column(
            children: <Widget>[
              Visibility(
                visible: widget.showTitleBar,
                child: SecondaryTitleBar(
                  titleText: widget.titleBarText,
                ),
              ),
              UserProfileFullDisplay(
                userDisplayName: widget.userDisplayName,
                userMotto: widget.userMotto,
                userPicUri: widget.userAvatarUri,
                backgroundUri: widget.userBackgrounUri,
                userLevel: widget.userLevel,

                showDisplayName: true,
                showMotto: true,
                showIconLevel: true,
                tabToEditName: false,
                canChangeAvartar: false,
                canChangeBackground: false,
                backgroundHeight: WholaySpace.profileBackgroundHeight,
              ),              
              Visibility(
                visible: widget.visibleFollowButton ?? false,
                child: Container(
                  color: WholayColors.backgroundSecondary,
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: WholaySpace.edgeHorizontal),
                  alignment: Alignment.centerRight,
                  child: ContainerButton(
                    buttonWidth: 120.0,
                    caption: Text('ติดตาม', style: TextStyle(
                      color: Colors.white,
                      fontFamily: Theme.of(context).textTheme.title.fontFamily,
                      fontSize: Theme.of(context).textTheme.body1.fontSize - 3,
                      fontWeight: FontWeight.bold
                    )),
                    icon: Icon(FontAwesomeIcons.thumbtack, color: Colors.white, size: 20.0),
                  ),
                ),
              ),              
              Visibility(
                visible: widget.showEmail && (widget.email != null) && (widget.email.isNotEmpty),
                child: ListTileWithData(
                  title: 'E-Mail',
                  data: widget.email,
                  dataUnderTitle: true,
                  showLowerDivide: true,
                ),
              ),
              Visibility(
                visible: widget.showMobileNo && (widget.mobileNo != null) && (widget.mobileNo.isNotEmpty),
                child: ListTileWithData(
                  title: 'เบอร์โทรศัพท์',
                  data: widget.mobileNo,
                  dataUnderTitle: true,
                  showLowerDivide: true,
                ),
              ),
              Visibility(
                visible: (widget.showFullName || widget.showGender) && (_nameInfoGroupData().isNotEmpty),
                child: ListTileWithData(
                  title: _nameInfoGroupTitle(),
                  data: _nameInfoGroupData(),
                  dataUnderTitle: true,
                  showLowerDivide: true,
                ),
              ),
              Visibility(
                visible: (widget.showRace || widget.showNationality || widget.showReligion) && (_raceInfoGroupData().isNotEmpty),
                child: ListTileWithData(
                  title: _raceInfoGroupTitle(),
                  data: _raceInfoGroupData(),
                  dataUnderTitle: true,
                  showLowerDivide: true,
                ),
              ),
              Visibility(
                visible: (widget.showBirthdate || widget.showAge) && (_birthInfoGroupData().isNotEmpty),
                child: ListTileWithData(
                  title: _birthInfoGroupTitle(),
                  data: _birthInfoGroupData(),
                  dataUnderTitle: true,
                  showLowerDivide: true,
                ),
              ),
              Visibility(
                visible: (widget.showAmphor || widget.showProvince || widget.showCountry) && (_addressGroupData().isNotEmpty),
                child: ListTileWithData(
                  title: 'ที่อยู่',
                  data: _addressGroupData(),
                  dataUnderTitle: true,
                  showLowerDivide: true,
                ),
              ),
            ],
          );
        }
      },
    );
    
    // ListView(
    //   children: <Widget>[
    //     Visibility(
    //       visible: widget.showTitleBar,
    //       child: SecondaryTitleBar(
    //         titleText: widget.titleBarText,
    //       ),
    //     ),
    //     UserProfileFullDisplay(
    //       userDisplayName: widget.userDisplayName,
    //       userMotto: widget.userMotto,
    //       userPicUri: widget.userAvatarUri,
    //       backgroundUri: widget.userBackgrounUri,
    //       userLevel: widget.userLevel,

    //       showDisplayName: true,
    //       showMotto: true,
    //       showIconLevel: true,
    //       tabToEditName: true,
    //       canChangeAvartar: false,
    //       canChangeBackground: false,
    //       backgroundHeight: WholaySpace.profileBackgroundHeight,
    //     ),
    //     Visibility(
    //       visible: widget.showFullName || widget.showGender,
    //       child: ListTileWithData(
    //         title: widget.showFullName ? (widget.showGender ? 'ชื่อ-นามสกุล, เพศ' : 'ชื่อ-นามสกุล') : (widget.showGender ? 'เพศ' : ''),
    //         data: widget.showFullName 
    //               ? (widget.showGender ? (widget.fullName ?? '') + ', ' + (widget.gender ?? '') : widget.fullName) 
    //               : (widget.showGender ? widget.gender : ''),
    //       ),
    //     ),
    //     ListTileWithData(
    //       title: 'E-Mail',
    //       data: widget.email,
    //       onTap: () {},
    //     ),
    //   ],
    // );
  }
}