import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';

class PageMenus{
  static const String saveMenu = 'บันทึกข้อมูล';
  static const String clearMenu = 'ล้างข้อมูล';

  static const List<String> menus = <String>[
    saveMenu,
    clearMenu,
  ];
} 

class ForgotPWknowEmailPage extends StatefulWidget {

  ForgotPWknowEmailPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _ForgotPWknowEmailPageState createState() => _ForgotPWknowEmailPageState();
}

class _ForgotPWknowEmailPageState extends State<ForgotPWknowEmailPage> {

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
          icon: BackPageIcon(), // Icon(Icons.arrow_back),
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
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            backgroundColor: WholayColors.backgroundPrimary,
            title: Text(
              'รหัสผ่าน',
              style: secondaryAppBarTitleStyle(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              verticalSpace(30.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('ลืมรหัสผ่าน', style: secondaryHeaderLabelStyle(context)),
                    verticalSpace(10.0),
                    Text(
                      'เมื่อคุณกด "ขอรหัส OTP" รหัสผ่านครั้งเดียว (OTP) จะถูกส่งไปยัง E-Mail ที่คุณลงทะเบียนไว้',
                      style: dataInfoLabelStyle(context),
                    ),
                    verticalSpace(10.0),
                    Text(
                      'เมื่อคุณได้รับรหัส OTP กรุณากรอกรหัส OTP ที่ได้รับในช่องข้างล่างนี้ เพื่อ Reset รหัสผ่านของคุณ',
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