import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';


class PageMenus{
  static const String saveMenu = 'OK';

  static const List<String> menus = <String>[
    saveMenu,
  ];
}

class PasswordProtectPage extends StatefulWidget {

  PasswordProtectPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _PasswordProtectPageState createState() => _PasswordProtectPageState();
}

class _PasswordProtectPageState extends State<PasswordProtectPage> {

  final _formKey = GlobalKey<FormState>();

  void menuAction(String menu) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: ClosePageIcon(),  // Icon(Icons.close, size: WholaySpace.headIconSize),
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
              'สอบถามรหัสผ่าน',
              style: secondaryAppBarTitleStyle(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                child: Column(
                children: <Widget>[
                  verticalSpace(50.0),
                  Text(
                    'บัญชีผู้ใช้นี้ปกป้องการเข้าถึงบัญชีด้วยการเปิดใช้การสอบถามรหัสผ่านก่อนเข้าถึงบัญชีผู้ใช้'
                  ),
                  verticalSpace(20.0),
                  Text(
                    'กรุณาพิมพ์รหัสผ่านของคุณ เพื่อเข้าถึงบัญชีผู้ใช้งาน'
                  ),
                  verticalSpace(50.0),
                  Form(
                    key: _formKey,
                    child: PasswordInput(
                      labelText: 'รหัสผ่าน',
                      hintText: 'รหัสผ่านเข้าใช้ของคุณ',
                      required: true,
                      checkPattern: false,
                      showUpperLabel: true,
                    ),
                  ),
                  SaveFullWidthButton(
                    upperSpace: 60.0,
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
    );
  }
}