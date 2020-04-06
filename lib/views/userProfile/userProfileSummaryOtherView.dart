import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/widgets/userProfile/userProfileDisplay.dart';

class UserProfileSummaryOtherViewPage extends StatefulWidget {

  UserProfileSummaryOtherViewPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
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
  }) : super(key: key);

  final String    pageTitle;
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

  @override
  _UserProfileSummaryOtherViewPageState createState() => _UserProfileSummaryOtherViewPageState();
}

class _UserProfileSummaryOtherViewPageState extends State<UserProfileSummaryOtherViewPage> {
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
        title: Text(widget.pageTitle),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              automaticallyImplyLeading: false,
              backgroundColor: WholayColors.backgroundPrimary,
              title: Text(
                'มุมมองที่ผู้อื่นเห็น',
                style: secondaryAppBarTitleStyle(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                UserProfileFullInfoDisplay(
                  showTitleBar: false,
                  showFullName: widget.showFullName,
                  showGender: widget.showGender,
                  showRace: widget.showRace,
                  showNationality: widget.showNationality,
                  showReligion: widget.showReligion,
                  showBirthdate: widget.showBirthdate,
                  showAge: widget.showAge,
                  showAmphor: widget.showAmphor,
                  showProvince: widget.showProvince,
                  showCountry: widget.showCountry,
                  showEmail: widget.showEmail,
                  showMobileNo: widget.showMobileNo,

                  userDisplayName: widget.userDisplayName,
                  userMotto: widget.userMotto, 
                  userLevel: widget.userLevel,
                  fullName: widget.fullName,
                  gender: widget.gender,
                  race: widget.race,
                  nationality: widget.nationality, 
                  religion: widget.religion,
                  birthdate: widget.birthdate,
                  amphor: widget.amphor,
                  province: widget.province,
                  country: widget.country,
                  email: widget.email,
                  mobileNo: widget.mobileNo, 
                ),
              ]),
            ),
          ],        
        ),
      ),
    );
  }
}