import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:date_format/date_format.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:wholay/widgets/userProfile/userProfileWidget.dart';
import 'package:wholay/widgets/post_feed_widget.dart';

class MainFeedPage extends StatefulWidget {
  @override
  _MainFeedPageState createState() => _MainFeedPageState();
}

class _MainFeedPageState extends State<MainFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.backgroundSecondary,
      // appBar: AppBar(
      //   title: Text('News Feed'),
      // ),
      body: ListView(
        children: <Widget>[
          PostFeedsWidget(
            key: PageStorageKey<String>('TH1908112045A001'),
            feedsType: FeedsType.recipient,
            postNo: 'TH1908112045A001',
            feedTitle: 'แปลเอกสาร ไทย -> อังกฤษ',
            postDate: DateTime.utc(2019, 8, 11, 20, 45),
            requiredFrom: DateTime.utc(2019, 8, 15),
            requiredTo: DateTime.utc(2019, 8, 31),
            urgencyType: UrgencyType.urgent,
            feedContent: 'ต้องการคนแปลเอกสารไทยเป็นอังกฤษ เพื่อใช้ในการติดต่อกับต่างประเทศจำนวน 25 แผ่น A4 ช่วยหน่อยนะคะ ทำที่บ้านได้ ส่งทางออนไลน์ค่ะ ' +
                          'เอกสารเป็นไฟล์ pdf ตั้งแต่คำนำ สารบัญ กับเนื้อหาอีก 20 หน้า สามารถแบ่งกันไปทำได้นะคะ ต้องการช่วยแปลกี่หน้าแล้วแต่สะดวกค่ะ ตัวอย่างที่ต้องการให้แปล ดูจากรูปประกอบค่ะ',
            feedPics: [
              Image.asset('imgs/sample1.png'),
              Image.asset('imgs/sample2.jpg'),
            ],
            ownerAvatar: Image.asset('imgs/user_girl_sample1.png'),
            ownerName: 'จูน วรัญญา',
            ownerLevel: 2,
            ownerMemberDate: DateTime.utc(2019, 2, 14),
            ownerScore: 0,
            ownerRecipientScore: 5,
            ownerVolunteerScore: 2,
            volunteerNo: 7,
            volunteerApprovalNo: 2,
            opinionNo: 25,
          ),          
          PostFeedsWidget(
            key: PageStorageKey<String>('TH1908112045A002'),
            feedsType: FeedsType.volunteer,
            postNo: 'TH1908112045A002',
            feedTitle: 'รับสอนภาษาอังกฤษ',
            postDate: DateTime.utc(2019, 8, 11, 20, 45),
            requiredFrom: DateTime.utc(2019, 8, 15),
            requiredTo: DateTime.utc(2019, 8, 31),
            urgencyType: UrgencyType.mostUrgent,
            feedContent: 'รับสอนภาษาอังกฤษสำหรับเด็กอายุไม่เกิน 13 ปี ไม่จำเป็นต้องมีพื้นฐาน สอนตั้งแต่ A B C เลยค่ะ ' +
                          'เรียนเป็นกลุ่มได้ แต่ต้องมีสถานที่ให้พอเพียงกับจำนวนผู้เรียน รับสมัครภายในสิ้นเดือน ส.ค. นี้เท่านั้น เรียน จ., พ., ศ. ช่วงเย็น 2 เดือนนะคะ ว่างค่ะ อยากทำดี ^^',
            // feedPics: [
            //   Image.asset('imgs/sample1.png'),
            //   Image.asset('imgs/sample2.jpg'),
            // ],
            ownerAvatar: Image.asset('imgs/user_girl_sample6.png'),
            ownerName: 'นิโคล สอนภาษาอังกฤษอันเดับหนึ่ง',
            ownerLevel: 4,
            ownerMemberDate: DateTime.utc(2019, 2, 14),
            ownerScore: 22,
            ownerRecipientScore: 9,
            ownerVolunteerScore: 14,
            volunteerNo: 7,
            volunteerApprovalNo: 2,
            opinionNo: 17,
            likeScore: 23,
          ),
          verticalSpace(WholaySpace.controlVerticalLoose),
        ],
      ),
    );
  }
}
