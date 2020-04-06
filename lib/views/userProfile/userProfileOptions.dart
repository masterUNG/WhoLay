import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/main.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/views/userProfile/userProfileSummaryOtherView.dart';


class PageMenus{
  static const String defaultMenu = 'กำหนดตามค่าเริ่มต้น';
  static const String viewMenu = 'ดูมุมมองที่ผู้อื่นเห็น';

  static const List<String> menus = <String>[
    defaultMenu,
    viewMenu,
  ];
} 

class UserProfileOptionsSettingPage extends StatefulWidget {

  UserProfileOptionsSettingPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _UserProfileOptionsSettingPageState createState() => _UserProfileOptionsSettingPageState();
}

class _UserProfileOptionsSettingPageState extends State<UserProfileOptionsSettingPage> {

  bool _showFullName  = true;
  bool _showGender = true;
  bool _showRace = true;
  bool _showNationality = true;
  bool _showReligion = true;
  bool _showBirthdate = false;
  bool _showAge = true;
  bool _showAmphor = false;
  bool _showProvince = true;
  bool _showCountry = true;
  bool _showEmail = false;
  bool _showMobileNo = false;

  void menuAction(String menu) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: BackPageIcon(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.pageTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => UserProfileSummaryOtherViewPage(
                  showFullName: _showFullName,
                  showGender: _showGender,
                  showRace: _showRace,
                  showNationality: _showNationality,
                  showReligion: _showReligion,
                  showBirthdate: _showBirthdate,
                  showAge: _showAge,
                  showAmphor: _showAmphor,
                  showProvince: _showProvince,
                  showCountry: _showCountry,
                  showEmail: _showEmail,
                  showMobileNo: _showMobileNo,

                  userDisplayName: userModel.displayName,
                  userMotto: userModel.motto, 
                  userLevel: userModel.userLevel,
                  fullName: userModel.fullName,
                  gender: userModel.gender,
                  race: userModel.race,
                  nationality: userModel.nationality, 
                  religion: userModel.religion,
                  birthdate: userModel.birthdate,
                  amphor: userModel.addrAmphor,
                  province: userModel.addrProvince,
                  country: userModel.addrCountry,
                  email: userModel.email,
                  mobileNo: userModel.mobileNo, 
                ))
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: menuAction,
            itemBuilder: (BuildContext context) {
              return PageMenus.menus.map((String menu) {
                return PopupMenuItem<String>(
                  value: menu,
                  child: Text(menu),
                );
              }).toList();              
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            backgroundColor: WholayColors.backgroundPrimary,
            title: Text(
              'ตั้งค่าข้อมูลส่วนบุคคล',
              style: secondaryAppBarTitleStyle(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: WholaySpace.edgeHorizontal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'ตั้งค่าความปลอดภัย',
                      style: secondaryHeaderLabelStyle(context)
                    ),
                    Text(
                      'กำหนดให้ก่อนเข้าถึงข้อมูลส่วนบุคคลหรือบัญชีผู้ใช้ของคุณ จะต้องใส่รหัสผ่านก่อนหรือไม่ เพื่อปกป้องข้อมูลส่วนบุคคลของคุณ กรณีโทรศัพท์ของคุณอาจถูกใช้โดยผู้อื่น',
                      style: dataInfoLabelStyle(context),
                    ),
                    verticalSpace(15.0),
                    SwitchLabelInput(
                      labelText: 'ถามรหัสผ่านก่อนเข้าบัญชีผู้ใช้',
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              lineDivideFader(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: WholaySpace.edgeHorizontal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'กำหนดข้อมูลแสดง',
                      style: secondaryHeaderLabelStyle(context)
                    ),
                    Text(
                      'กำหนดข้อมูลที่จะแสดงให้ผู้อื่นเห็น เมื่อมีผู้เข้าดูบัญชีผู้ใช้ของคุณ',
                      style: dataInfoLabelStyle(context),
                    ),
                    verticalSpace(15.0),
                    SwitchLabelInput(
                      labelText: 'E-Mail',
                      value: _showEmail,
                      onChanged: (value) {
                        _showEmail = value;                          
                      },
                    ),
                    SwitchLabelInput(
                      labelText: 'หมายเลขโทรศัพท์',
                      value: _showMobileNo,
                      onChanged: (value) {_showMobileNo = value;},
                    ),
                    SwitchLabelInput(
                      labelText: 'ชื่อนามสกุลจริง',
                      value: _showFullName,
                      onChanged: (value) {_showFullName = value;},
                    ),
                    SwitchLabelInput(
                      labelText: 'เพศ',
                      value: _showGender,
                      onChanged: (value) {_showGender = value;},
                    ),
                    SwitchLabelInput(
                      labelText: 'เชื้อชาติ สัญชาติ',
                      value: _showNationality,
                      onChanged: (value) {
                        _showNationality = value;
                        _showRace = value;
                      },
                    ),
                    SwitchLabelInput(
                      labelText: 'ศาสนา',
                      value: _showReligion,
                      onChanged: (value) {_showReligion = value;},
                    ),
                    SwitchLabelInput(
                      labelText: 'วันเกิด',
                      value: _showBirthdate,
                      onChanged: (value) {_showBirthdate = value;},
                    ),
                    SwitchLabelInput(
                      labelText: 'อายุ',
                      value: _showAge,
                      onChanged: (value) {_showAge = value;},
                    ),
                    SwitchLabelInput(
                      labelText: 'อำเภอ/เขต',
                      value: _showAmphor,
                      onChanged: (value) {_showAmphor = value;},
                    ),
                    SwitchLabelInput(
                      labelText: 'จังหวัด',
                      value: _showProvince,
                      onChanged: (value) {_showProvince = value;},
                    ),
                    SwitchLabelInput(
                      labelText: 'ประเทศ',
                      value: _showCountry,
                      onChanged: (value) {_showCountry = value;},
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}