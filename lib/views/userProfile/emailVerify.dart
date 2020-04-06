import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/main.dart';

class PageMenus{
  static const String verifyMenu = 'verify';

  static const List<String> menus = <String>[
    verifyMenu,
  ];
} 

class EmailVerifyPage extends StatefulWidget {

  EmailVerifyPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _EmailVerifyPageState createState() => _EmailVerifyPageState();
}

class _EmailVerifyPageState extends State<EmailVerifyPage> {

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
            icon: Icon(Icons.autorenew),
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
              'E-Mail verification',
              style: secondaryAppBarTitleStyle(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    verticalSpace(30.0),
                    Row(
                      children: <Widget>[
                        Icon(Icons.email, color: WholayColors.primary, size: WholaySpace.headIconSize),
                        horizontalSpace(15.0),
                        Text(
                          'E-Mail ที่ลงทะเบียน',
                          style: primaryHeaderLabelStyle(context),
                        ),
                      ],
                    ),
                    verticalSpace(15.0),
                    Text(
                      // 'thanaibox@gmail.com',
                      userModel.email,
                      style: dataHeaderLabelStyle(context),
                      // TextStyle(
                      //   fontFamily: Theme.of(context).textTheme.title.fontFamily,
                      //   fontSize: Theme.of(context).textTheme.title.fontSize,
                      //   color: WholayColors.textDataPrimary
                      // )
                    )
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
                    Row(
                      children: <Widget>[
                        Icon(Icons.notifications, color: WholayColors.primary),
                        horizontalSpace(10.0),
                        Text('E-Mail verification', style: secondaryHeaderLabelStyle(context))
                      ],
                    ),
                    verticalSpace(10.0),
                    Padding(
                      padding: EdgeInsets.only(left: 33.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'กดปุ่ม Verify เพื่อส่งการ Verify ไปยัง E-Mail ที่คุณได้ลงทะเบียนไว้',
                            style: dataInfoLabelStyle(context),
                          ),
                          verticalSpace(8.0),
                          Text(
                            'เมื่อกดปุ่ม Verify แล้ว ให้ทำการตรวจสอบ E-Mail ของคุณ และคลิกลิงค์ที่ได้รับเพื่อทำการ Verify',
                            style: dataInfoLabelStyle(context)
                          ),
                        ],
                      ),
                    ),                    
                    verticalSpace(50.0),
                    FullWidthButton(
                      caption: 'VERIFY',
                      icon: Icon(Icons.autorenew),
                      onPressed: () {},
                    ),
                    verticalSpace(60.0),
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