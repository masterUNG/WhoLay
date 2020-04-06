import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/views/userProfile/forgotPWknowEmail.dart';

class PageMenus{
  static const String saveMenu = 'บันทึกข้อมูล';
  static const String clearMenu = 'ล้างข้อมูล';

  static const List<String> menus = <String>[
    saveMenu,
    clearMenu,
  ];
} 

class PasswordCorrectPage extends StatefulWidget {

  PasswordCorrectPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _PasswordCorrectPageState createState() => _PasswordCorrectPageState();
}

class _PasswordCorrectPageState extends State<PasswordCorrectPage> {

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
      body: SafeArea(
        child: CustomScrollView(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      verticalSpace(30.0),
                      Text(
                        'แก้ไขรหัสผ่าน',
                        style: primaryHeaderLabelStyle(context),
                      ),
                      verticalSpace(20.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('รหัสผ่านปัจจุบัน', style: controlLabelStyle(context)),
                                ForgotPasswordIconLabel(
                                  iconColor: Colors.purple[300],
                                  labelColor: Colors.purple[300],
                                  onPressed: () {
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(builder: (context) => ForgotPWknowEmailPage()),
                                    );
                                  },
                                ),
                              ],
                            ),
                            verticalSpace(WholaySpace.controlLabelVertical),
                            PasswordInput(
                              labelText: 'รหัสผ่านปัจจุบัน',
                              hintText: 'รหัสผ่านเข้าใช้ของคุณ',
                              required: true,
                              checkPattern: false,
                              showUpperLabel: false,
                            ),
                            verticalSpace(WholaySpace.controlVerticalLoose),
                            PasswordInput(
                              labelText: 'รหัสผ่านใหม่',
                              hintText: 'รหัสผ่านใหม่ที่ต้องการ',
                              required: true,
                              checkPattern: true,
                              showUpperLabel: true,
                            ),
                            verticalSpace(WholaySpace.controlVerticalLoose),
                            PasswordInput(
                              labelText: 'ยืนยันรหัสผ่านใหม่',
                              hintText: 'ยืนยันรหัสผ่านใหม่อีกครั้ง',
                              required: false,
                              checkPattern: false,
                              showUpperLabel: true,
                            ),
                          ],
                        ),
                      ),
                      SaveFullWidthButton(
                        upperSpace: 50.0,
                        lowerSpace: 60.0,
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
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}