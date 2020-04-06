import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/views/userProfile/smsVerify.dart';
import 'package:wholay/main.dart';
import 'package:wholay/services/user_service.dart';
import 'package:wholay/dialogs.dart';

class PageMenus{
  static const String saveMenu = 'บันทึกข้อมูล';
  static const String clearMenu = 'ล้างข้อมูล';

  static const List<String> menus = <String>[
    saveMenu,
    clearMenu,
  ];
} 

class MobileNoEntryPage extends StatefulWidget {

  MobileNoEntryPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _MobileNoEntryPageState createState() => _MobileNoEntryPageState();
}

class _MobileNoEntryPageState extends State<MobileNoEntryPage> {

  final _formKey = GlobalKey<FormState>();
  final _phoneNoController = TextEditingController();
  final UserService _userService = UserService();
  String _mobileNo;
  bool _enabled = false;

  void menuAction(String menu) {
    if (menu == PageMenus.clearMenu) {

    }
  }

  @override
  void initState() {
    _mobileNo = userModel.mobileNo;
    _phoneNoController.text = userModel.mobileNo;

    _phoneNoController.addListener(() {
      setState(() {
        _enabled = ((_phoneNoController.text.isNotEmpty) && (_phoneNoController.text.trim() != _mobileNo));        
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _navigatorPop() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();

        try {
          if (userModel.userId != null)
            _userService.createOrUpdateProfile(
              uid: userModel.userId,
              displayName: userModel.displayName,
              motto: userModel.motto,
              mobileNo: _phoneNoController.text.trim(),
              avatarUrl: userModel.avatarUrl,
              coverUrl: userModel.coverUrl,
            ).then((_) 
              async{
                userModel.mobileNo = _phoneNoController.text.trim();
                Navigator.pop(context);
              }
            );
        } catch (e) {
          errorDialog(context, 'Error', e.toString());
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: BackPageIcon(), // Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.pageTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _navigatorPop,
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
            // leading: Icon(Icons.check_circle, color: Colors.green, size: 32.0,),
            title: Row(
              children: <Widget>[
                Text(
                  'หมายเลขโทรศัพท์มือถือ',
                  style: secondaryAppBarTitleStyle(),
                ),
                horizontalSpace(16.0),
                Icon(Icons.error, color: WholayColors.warningTab, size: WholaySpace.headIconSize),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Visibility(     // Warning Tab
                visible: true,  // Change visibility to false if already verified.
                child: Container(   
                  height: 48.0,
                  color: WholayColors.warningTab,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: WholaySpace.edgeHorizontal),
                      child: Text(
                        'หมายเลขโทรศัพท์ ยังไม่ Verify',
                        style: TextStyle(
                          fontFamily: WholayFonts.decoratedFontName,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(60.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'หมายเลขโทรศัพท์มือถือ',
                        style: controlLabelStyle(context),
                      ),
                    ),
                    verticalSpace(WholaySpace.controlLabelVertical),
                    Form(
                      key: _formKey,
                      child: PhoneNumberInput(
                        required: true,
                        inlineCountryInput: false,
                        controller: _phoneNoController,
                      ),
                    ),
                  ],
                ),
              ),
              SaveFullWidthButton(
                horizontalGap: WholaySpace.edgeHorizontal,
                upperSpace: 40.0,
                lowerSpace: 60.0,
                enabled: _enabled,
                onPressed: _navigatorPop,
              ),
              lineDivideFader(),
              VerifyTabButton(
                caption: 'กดส่ง SMS ใหม่เพื่อทำการ Verify',
                enabled: true,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SMSVerifyPage()));
                },
              ),
              lineDivideFader(),
              verticalSpace(60.0),
            ]),
          ),
        ],
      ),
    );
  }
}