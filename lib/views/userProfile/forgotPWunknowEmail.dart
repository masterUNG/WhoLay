import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';

class PageMenus{
  static const String otpMenu = 'ขอรหัส OTP';
  static const String verifyMenu = 'ตรวจสอบรหัส OTP';

  static const List<String> menus = <String>[
    otpMenu,
    verifyMenu,
  ];
} 

class ForgotPWunknowEmailPage extends StatefulWidget {

  ForgotPWunknowEmailPage({
    Key key,
    this.pageTitle = 'ลืมรหัสผ่าน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _ForgotPWunknowEmailPageState createState() => _ForgotPWunknowEmailPageState();
}

class _ForgotPWunknowEmailPageState extends State<ForgotPWunknowEmailPage> {

  final _formKey = GlobalKey<FormState>();

  void menuAction(String menu) {

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
        title: Text(widget.pageTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {},
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
          // SliverAppBar(
          //   pinned: true,
          //   floating: true,
          //   automaticallyImplyLeading: false,
          //   backgroundColor: WholayColors.backgroundPrimary,
          //   title: Text(
          //     'รหัสผ่าน',
          //     style: secondaryAppBarTitleStyle(),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildListDelegate([
              verticalSpace(40.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('ระบุ E-Mail ที่คุณได้ลงทะเบียนไว้', style: controlLabelStyle(context)),
                    verticalSpace(WholaySpace.controlLabelVertical),
                    EmailInput(
                      labelText: 'E-Mail',
                      hintText: 'ระบุ E-Mail ที่คุณได้ลงทะเบียนไว้',
                    ),
                    verticalSpace(30.0),
                    Text(
                      'กด "ขอรหัส OTP" เพื่อที่คุณจะได้รับรหัสผ่านครั้งเดียว (OTP) ส่งไปยัง E-Mail ตามที่คุณระบุไว้',
                      style: dataInfoLabelStyle(context),
                    ),
                    verticalSpace(10.0),
                    Text(
                      'เมื่อคุณได้รับรหัส OTP กรุณากรอกรหัส OTP ที่ได้รับในช่องรหัส OTP เพื่อ Reset ผ่านของคุณ',
                      style: dataInfoLabelStyle(context)
                    ),
                    verticalSpace(20.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton.icon(
                        icon: Icon(Icons.vpn_key),
                        label: Text('ขอรหัส OTP'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(30.0),
              lineDivideFader(),
              verticalSpace(30.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: OTPInput(
                        showReferNo: false,
                        validator: (value) {},
                      ),
                    ),
                    verticalSpace(30.0),
                    FullWidthButton(
                      caption: 'ตรวจสอบ',
                      icon: Icon(Icons.check),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          // Navigator.push(
                          //   context, 
                          //   MaterialPageRoute(builder: (context) => UserAcctEntryPage()),
                          // );
                        }
                      },
                    ),
                    verticalSpace(60.0),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}