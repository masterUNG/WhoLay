import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';

class MyServiceProfileEntryPage extends StatefulWidget {

  MyServiceProfileEntryPage({
    Key key,
    this.pageTitle = 'บริการของฉัน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _MyServiceProfileEntryPageState createState() => _MyServiceProfileEntryPageState();
}

class _MyServiceProfileEntryPageState extends State<MyServiceProfileEntryPage> {

  final _formKey = GlobalKey<FormState>();
  final int _adWordlen = 150;
  bool _showService = true;
  bool _openService = true;

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
            onPressed: () {},
          ),
          // PopupMenuButton<String>(
          // ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
            //   child: 
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        verticalSpace(30.0),
                        Text(
                          'ชื่อบริการ',
                          style: primaryHeaderLabelStyle(context),
                        ),
                        verticalSpace(WholaySpace.controlLabelVertical),
                        Text(
                          'ชื่อบริการ เป็นชื่อที่ตั้งเพื่อแสดงให้ผู้ใช้คนอื่นเห็นที่สื่อถึงบริการของคุณ ชื่อนี้จะแยกต่างหากจากชื่อ Profile ของคุณ '
                          'ชื่อบริการสามารถเป็นชื่อเดียวกับชื่อ Profile ของคุณได้ แต่จะต้องไม่ซ้ำกับชื่อบริการอื่นๆที่มีอยู่แล้ว',
                          style: minorLabelStyle(context),
                        ),
                        verticalSpace(WholaySpace.controlVerticalLoose),
                        InputWithLabel(
                          labelCaption: 'ชื่อบริการ',
                          labelText: 'ชื่อบริการ',
                          hintText: 'ชื่อบริการของคุณ',
                          showUpperLabel: false,
                          required: true,
                          lowerSpace: 30.0,
                        ),
                        Text(
                          'คำโฆษณา',
                          style: primaryHeaderLabelStyle(context),
                        ),
                        verticalSpace(WholaySpace.controlLabelVertical),
                        Text(
                          'บรรยายหรือโฆษณาลักษณะงานของคุณสั้นๆ ไม่เกิน ${_adWordlen.toString()} ตัวอักษร '
                          'เพื่อให้ผู้สนใจว่าจ้างอ่านงานของคุณแล้วสามารถเข้าใจได้อย่างรวดเร็ว',
                          style: minorLabelStyle(context),
                        ),
                        verticalSpace(WholaySpace.controlVerticalLoose),
                        InputWithLabel(
                          labelCaption: 'คำโฆษณา',
                          labelText: '',
                          hintText: 'คำบรรยายงานบริการของคุณ',
                          maxLength: _adWordlen,
                          maxLengthEnforced: true,
                          maxLines: 5,
                          // expands: true,
                          showUpperLabel: false,
                          required: true,
                          lowerSpace: 30.0,
                        ),
                      ],
                    ),
                  ),
                  lineDivideFader(),
                  verticalSpace(30.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'แสดงหรือซ่อนบริการจากผู้ใช้',
                          style: primaryHeaderLabelStyle(context),
                        ),
                        verticalSpace(WholaySpace.controlLabelVertical),
                        Text(
                          'คุณสามารถซ่อนหรือแสดงบริการของคุณจากผู้ใช้ได้ '
                          'การซ่อนบริการจะทำให้ผู้ใช้ไม่สามารถค้นหา หรือมองเห็นบริการของคุณได้ '
                          'ใช้ในกรณีที่คุณอาจอยู่ในระหว่างการปรับปรุงข้อมูล และไม่ต้องการให้ข้อมูลที่อยู่ระหว่างการปรับปรุงนั้น ปรากฏต่อผู้ใช้คนอื่นๆ',
                          style: minorLabelStyle(context),
                        ),
                        verticalSpace(WholaySpace.controlVerticalLoose),
                        SwitchLabelInput(
                          labelText: 'แสดงหรือซ่อนบริการ',
                          boldLabel: true,
                          value: _showService,
                          onChanged: (value) {
                            setState(() {
                              _showService = value;
                            });
                          },
                        ),
                        verticalSpace(10.0),
                      ],
                    ),
                  ),
                  lineDivideFader(),
                  verticalSpace(30.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'สถานะการให้บริการ',
                          style: primaryHeaderLabelStyle(context),
                        ),
                        verticalSpace(WholaySpace.controlLabelVertical),
                        Text(
                          'สถานะการให้บริการ เพื่อบอกให้ผู้ใช้บริการของคุณรู้ว่า คุณเปิดให้บริการอยู่หรือไม่ '
                          'ผู้ใช้จะยังคงมองเห็นและค้นหาบริการของคุณได้ แม้คุณจะตั้งสถานะเป็นปิดบริการ',
                          style: minorLabelStyle(context),
                        ),
                        verticalSpace(WholaySpace.controlVerticalLoose),
                        SwitchLabelInput(
                          labelText: 'สถานะการให้บริการ',
                          boldLabel: true,
                          value: _openService,
                          onChanged: (value) {
                            setState(() {
                              _openService = value;
                            });
                          },
                        ),
                        verticalSpace(10.0),
                      ],
                    ),
                  ),
                  lineDivideFader(),
                ],
              ),
              
              // Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       verticalSpace(30.0),
              //       Text(
              //         'ชื่อบริการ',
              //         style: primaryHeaderLabelStyle(context),
              //       ),
              //       verticalSpace(WholaySpace.controlLabelVertical),
              //       Text(
              //         'ชื่อบริการ เป็นชื่อที่ตั้งเพื่อแสดงให้ผู้ใช้คนอื่นเห็นที่สื่อถึงบริการของคุณ ชื่อนี้จะแยกต่างหากจากชื่อ Profile ของคุณ '
              //         'ชื่อบริการสามารถเป็นชื่อเดียวกับชื่อ Profile ของคุณได้ แต่จะต้องไม่ซ้ำกับชื่อบริการอื่นๆที่มีอยู่แล้ว',
              //         style: minorLabelStyle(context),
              //       ),
              //       verticalSpace(WholaySpace.controlVertical),
              //       InputWithLabel(
              //         labelCaption: 'ชื่อบริการ',
              //         labelText: 'ชื่อบริการ',
              //         hintText: 'ชื่อบริการของคุณ',
              //         showUpperLabel: false,
              //         required: true,
              //       ),
              //       verticalSpace(WholaySpace.controlVerticalLoose),

              //       Text(
              //         'คำโฆษณา',
              //         style: primaryHeaderLabelStyle(context),
              //       ),
              //       verticalSpace(WholaySpace.controlLabelVertical),
              //       Text(
              //         'บรรยายหรือโฆษณาลักษณะงานของคุณสั้นๆ ไม่เกิน ${_adWordlen.toString()} ตัวอักษร '
              //         'เพื่อให้ผู้สนใจว่าจ้างอ่านงานของคุณแล้วสามารถเข้าใจได้อย่างรวดเร็ว',
              //         style: minorLabelStyle(context),
              //       ),
              //       verticalSpace(WholaySpace.controlVertical),
              //       InputWithLabel(
              //         labelCaption: 'คำโฆษณา',
              //         labelText: '',
              //         hintText: 'คำบรรยายงานบริการของคุณ',
              //         maxLength: _adWordlen,
              //         maxLengthEnforced: true,
              //         maxLines: 5,
              //         // expands: true,
              //         showUpperLabel: false,
              //         required: true,
              //         lowerSpace: 30.0,
              //       ),
              //       lineDivideFader(),
              //     ],
              //   ),
              //   Column(
              //     children<Widget>[
              //       verticalSpace(30.0),
              //       Text(
              //         'แสดงหรือซ่อนบริการจากผู้ใช้',
              //         style: primaryHeaderLabelStyle(context),
              //       ),
              //       verticalSpace(WholaySpace.controlLabelVertical),
              //       Text(
              //         'คุณสามารถซ่อนหรือแสดงบริการของคุณจากผู้ใช้ได้ '
              //         'การซ่อนบริการจะทำให้ผู้ใช้ไม่สามารถค้นหา หรือมองเห็นบริการของคุณได้ '
              //         'ใช้ในกรณีที่คุณอาจอยู่ในระหว่างการปรับปรุงข้อมูล และไม่ต้องการให้ข้อมูลที่อยู่ระหว่างการปรับปรุงนั้น ปรากฏต่อผู้ใช้คนอื่นๆ',
              //         style: minorLabelStyle(context),
              //       ),
              //       verticalSpace(WholaySpace.controlVertical),
              //       SwitchLabelInput(
              //         labelText: 'แสดงหรือซ่อนบริการ',
              //         value: _showService,
              //         onChanged: (value) {
              //           setState(() {
              //             _showService = value;
              //           });
              //         },
              //       ),
              //     ],
              //   ),
              //       lineDivideFader(),
              //       verticalSpace(30.0),
              //       Text(
              //         'สถานะการให้บริการ',
              //         style: primaryHeaderLabelStyle(context),
              //       ),
              //       verticalSpace(WholaySpace.controlLabelVertical),
              //       Text(
              //         'สถานะการให้บริการ เพื่อบอกให้ผู้ใช้บริการของคุณรู้ว่า คุณเปิดให้บริการอยู่หรือไม่ '
              //         'ผู้ใช้จะยังคงมองเห็นและค้นหาบริการของคุณได้ แม้คุณจะตั้งสถานะเป็นปิดบริการ',
              //         style: minorLabelStyle(context),
              //       ),
              //       SwitchLabelInput(
              //         labelText: 'สถานะการให้บริการ',
              //         value: _openService,
              //         onChanged: (value) {
              //           setState(() {
              //             _openService = value;
              //           });
              //         },
              //       ),
              //       verticalSpace(30.0),
              //       Text(
              //         'วัน-เวลาให้บริการ',
              //         style: primaryHeaderLabelStyle(context),
              //       ),
              //     ],
                // ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}