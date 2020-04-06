import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/widgets/photoWidget.dart';

class UserAccountConfirmPage extends StatefulWidget {

  UserAccountConfirmPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _UserAccountConfirmPageState createState() => _UserAccountConfirmPageState();
}

class _UserAccountConfirmPageState extends State<UserAccountConfirmPage> {
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
            icon: Icon(Icons.check),
            onPressed: () {},
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
            title: Row(
              children: <Widget>[
                Text(
                  'ข้อมูลยืนยันตัวตน',
                  style: secondaryAppBarTitleStyle(),
                ),
                horizontalSpace(20.0),
                WaitingIcon(),  // If ready info show CheckRightIcon else WaitingIcon
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(WholaySpace.edgeHorizontal),
                child: Text(
                  'เมื่อคุณให้ข้อมูลยืนยันตัวตนข้างล่างนี้อย่างครบถ้วน และเจ้าหน้าที่ทำการตรวจสอบและอนุมัติข้อมูลของคุณแล้ว '
                  'คุณจะได้เลื่อนระดับสถานะบัญชีผู้ใช้ของคุณเป็นระดับที่ 4 (4 โบว์) เพื่อให้ผู้ใช้คนอื่นๆ เห็นว่า บัญชีผู้ใช้ของคุณมีความน่าเชื่อถือในระดับสูง',
                  style: minorLabelStyle(context),
                ),
              ),
              lineDivideFader(),
              PhotoTaken(
                bottomIndent: 30.0,
                backgroundImagePath: 'imgs/profiles/Person2.png',
                title: '1. รูปหน้าตรง',
                noImageText: 'ลงรูปถ่ายหน้าตรงของคุณ ที่เห็นหน้าได้อย่างชัดเจน ไม่ใส่หมวก ไม่ใส่แว่นตาดำ หรือปกปิดใบหน้า '
                              'และเป็นภาพที่ใกล้เคียงกับหนังสือสำคัญที่ใช้ในการยืนยันตัวตนของคุณ',
              ),
              PhotoTaken(
                bottomIndent: 30.0,
                backgroundImagePath: 'imgs/profiles/ID-Card-pict2.png',
                title: '2. รูปเอกสารสำคัญ',
                noImageText: 'รูปเอกสารสำคัญ เช่น รูปบัตรประชาชน หรือหนังสือเดินทาง ตามที่คุณได้ลงทะเบียนไว้กับเรา '
                              'ให้เห็นรายละเอียดเอกสารชัดเจน และเห็นภาพถ่ายใบหน้าของคุณในเอกสารนั้น',
              ),
              PhotoTaken(
                bottomIndent: 30.0,
                backgroundImagePath: 'imgs/profiles/Person-ID2.png',
                title: '3. รูปหน้าตรงถือเอกสารสำคัญ',
                noImageText: 'รูปถ่ายใบหน้าของคุณ ถือเอกสารสำคัญในข้อ 2. เทียบข้างใบหน้าของคุณ',
              ),
              SaveFullWidthButton(
                horizontalGap: WholaySpace.edgeHorizontal,
                lowerSpace: 60.0,
                onPressed: () {},
              )
            ]),
          ),
        ],
      ),
    );
  }
}