import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/widgets/userProfile/skill_list_widget.dart';

class SkillOptionsPage extends StatefulWidget {

  SkillOptionsPage({
    Key key,
    this.pageTitle = 'Skill options',
    this.visibleBackButton = true,
  }) : super(key: key);

  final String  pageTitle;
  final bool    visibleBackButton;

  @override
  _SkillOptionsPageState createState() => _SkillOptionsPageState();
}

class _SkillOptionsPageState extends State<SkillOptionsPage> {


  @override
  Widget build(BuildContext context) {

    _saveSkillOption() {
      Navigator.pop(context);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.surface,
      appBar: AppBar(
        leading: Visibility(
          visible: widget.visibleBackButton,
          child: IconButton(
            icon: BackPageIcon(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(widget.pageTitle),
        titleSpacing: (!widget.visibleBackButton) ? -34.0 : 12.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              _saveSkillOption();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: SkillListWidget()),
          SaveFullWidthButton(
            horizontalGap: WholaySpace.edgeHorizontal,
            lowerSpace: 20.0,
            upperSpace: 20.0,
            onPressed: () {
              _saveSkillOption();
            },
          )
        ],
      ),
    );
  }
}