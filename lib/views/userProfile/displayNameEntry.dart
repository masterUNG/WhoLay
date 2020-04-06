import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/models/userAccount_model.dart';

class PageMenus{
  static const String saveMenu = 'บันทึกข้อมูล';
  static const String clearMenu = 'ล้างข้อมูล';

  static const List<String> menus = <String>[
    saveMenu,
    clearMenu,
  ];
}

class DisplayNameEntryPage extends StatefulWidget {

  DisplayNameEntryPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
    this.userModel,
  }) : super(key: key);

  final String pageTitle;
  final UserAccountModel userModel;

  @override
  _DisplayNameEntryPageState createState() => _DisplayNameEntryPageState();
}

class _DisplayNameEntryPageState extends State<DisplayNameEntryPage> {

  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _mottoController = TextEditingController();


  void menuAction(String menu) {
    if (menu == PageMenus.clearMenu) {
      _mottoController.clear();
      _displayNameController.clear();
    }
  }

  @override
  void initState() {
    _displayNameController.text = widget.userModel.displayName;
    _mottoController.text = widget.userModel.motto;

    // _displayNameController.addListener(() {
    //   widget.userModel.displayName = _displayNameController.text;
    // });

    // _mottoController.addListener(() {
    //   widget.userModel.motto = _mottoController.text;
    // });

    super.initState();
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _mottoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _navigatorPop() {
      if (_formKey.currentState.validate()) {
        widget.userModel.displayName = _displayNameController.text;
        widget.userModel.motto = _mottoController.text;
        _formKey.currentState.save();
        Navigator.pop(context, widget.userModel);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.surface,
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
            title: Text(
              'แก้ไขชื่อแสดง',
              style: secondaryAppBarTitleStyle(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              verticalSpace(80.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                child: Form(
                  key: _formKey,
                  child: UserDisplayNameInput(
                    displayNamecontroller: _displayNameController,
                    mottocontroller: _mottoController,
                    requiredDisplayName: true,
                    requiredMotto: false,
                    showUpperLabel: true,
                  ),
                ),
              ),
              SaveFullWidthButton(
                horizontalGap: WholaySpace.edgeHorizontal,
                upperSpace: 60.0,
                lowerSpace: 60.0,
                onPressed: _navigatorPop,
              )
            ]),
          ),
        ],
      ),
    );
  }
}