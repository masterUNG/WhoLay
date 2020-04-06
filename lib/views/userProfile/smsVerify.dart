import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';

class PageMenus{
  static const String otpMenu = 'ตรวจสอบ OTP';
  static const String smsMenu = 'ส่ง SMS อีกครั้ง';

  static const List<String> menus = <String>[
    otpMenu,
    smsMenu,
  ];
} 

class SMSVerifyPage extends StatefulWidget {

  SMSVerifyPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _SMSVerifyPageState createState() => _SMSVerifyPageState();
}

class _SMSVerifyPageState extends State<SMSVerifyPage> {

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
            // leading: Icon(Icons.check_circle, color: Colors.green, size: 32.0,),
            title: Text(
              'ยืนยันหมายเลขโทรศัพท์ด้วย OTP',
              style: secondaryAppBarTitleStyle(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              verticalSpace(30.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.notifications, color: WholayColors.primary),
                        horizontalSpace(10.0),
                        Text('SMS verification', style: secondaryHeaderLabelStyle(context))
                      ],
                    ),
                    verticalSpace(10.0),
                    Padding(
                      padding: EdgeInsets.only(left: 33.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'กรุณาตรวจสอบ SMS ในโทรศัพท์ของคุณตามที่ได้ลงทะเบียนไว้ กรอกหมายเลข OTP ที่ได้รับลงในช่องรหัส OTP เพื่อทำการ Verify',
                            style: dataInfoLabelStyle(context),
                          ),
                          verticalSpace(10.0),
                          Text(
                            'หากต้องการให้ทำการส่ง SMS ใหม่ กด "ส่งใหม่"',
                            style: dataInfoLabelStyle(context)
                          ),
                        ],
                      ),
                    ),                    
                    verticalSpace(20.0),
                    Align(
                      alignment: Alignment.center,
                      child: RaisedButton.icon(
                        icon: Icon(Icons.autorenew),
                        label: Text('ส่งใหม่'),
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
                        referNo: 777,
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