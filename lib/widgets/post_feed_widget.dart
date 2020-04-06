import 'dart:core';

import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:date_format/date_format.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wholay/widgets/userProfile/userProfileWidget.dart';

enum FeedsType {unspecify, volunteer, recipient}

enum UrgencyType {normal, urgent, mostUrgent}

class PostFeedsWidget extends StatefulWidget {

  PostFeedsWidget({
    Key key,
    this.postNo,
    this.feedsType = FeedsType.unspecify,
    this.feedTitle,
    this.postDate,
    this.requiredFrom,
    this.requiredTo,
    this.urgencyType = UrgencyType.normal,
    this.feedContent,
    this.feedPics,
    this.ownerAvatar,
    this.ownerName,
    this.ownerMemberDate,
    this.ownerLevel,
    this.ownerScore = 0,
    this.ownerVolunteerScore = 0,
    this.ownerRecipientScore = 0,
    this.volunteerNo = 0,
    this.volunteerApprovalNo = 0,
    this.opinionNo = 0,
    this.likeScore = 0,
  }) : super(key: key);

  final String      postNo;
  final FeedsType   feedsType;
  final String      feedTitle;
  final DateTime    postDate;
  final DateTime    requiredFrom;
  final DateTime    requiredTo;
  final UrgencyType urgencyType;
  final String      feedContent;
  final List<Image> feedPics;
  final Image       ownerAvatar;
  final String      ownerName;
  final DateTime    ownerMemberDate;
  final int         ownerLevel;
  final int         ownerScore;
  final int         ownerVolunteerScore;
  final int         ownerRecipientScore;
  final int         volunteerNo;
  final int         volunteerApprovalNo;
  final int         opinionNo;
  final int         likeScore;

  @override
  _PostFeedsWidgetState createState() => _PostFeedsWidgetState();
}

class _PostFeedsWidgetState extends State<PostFeedsWidget> {

  Color   _titleTabColor;
  Color   _mainButtonColor;
  String  _titleCaption;
  String  _mainButtonCaption;
  String  _urgentStr;
  Color   _urgentColor;
  String  _requiredCaption;

  @override
  Widget build(BuildContext context) {

    // final List<Widget> listImgs = (widget.feedPics != null && widget.feedPics.isNotEmpty)
    //   ? widget.feedPics.map<Widget>((_imgs) {
    //     if (_imgs is ImageProvider) {
    //       return Image(
    //         image: _imgs,
    //       );
    //     }
    //   })
    //   : null;

    if (widget.feedsType == FeedsType.recipient) {
      _titleTabColor = WholayColors.recipientPrimary;
      _mainButtonColor = WholayColors.volunteerPrimary;
      _titleCaption = 'ต้องการอาสาสมัคร';
      _mainButtonCaption = 'ช่วยเหลือ';
      _requiredCaption = 'ต้องการภายใน';
    } else if (widget.feedsType == FeedsType.volunteer) {
      _titleTabColor = WholayColors.volunteerPrimary;
      _mainButtonColor = WholayColors.recipientPrimary;
      _titleCaption = 'อาสาสมัคร';
      _mainButtonCaption = 'ขอความช่วยเหลือ';
      _requiredCaption = 'สิ้นสุดใน';
    } else {
      _titleTabColor = WholayColors.primary;
      _mainButtonColor = WholayColors.primary;
      _titleCaption = 'ประกาศ';
      _mainButtonCaption = '';
      _requiredCaption = '';
    }

    if (widget.urgencyType == UrgencyType.normal) {
      _urgentStr = '';
      _urgentColor = Colors.blue[800];
    } if (widget.urgencyType == UrgencyType.urgent) {
      _urgentStr = 'เร่งด่วน';
      _urgentColor = Colors.pink[700];
    } if (widget.urgencyType == UrgencyType.mostUrgent) {
      _urgentStr = 'ด่วนที่สุด';
      _urgentColor = Colors.red[700];
    }

    double _scrWdt = MediaQuery.of(context).size.width;

    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: WholaySpace.controlVerticalLoose),
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey[200],
        //       blurRadius: 30.0,
        //       offset: Offset(0.0, 3.0),
        //     ),
        //   ],
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(  // Tab Title
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
              width: double.maxFinite,
              color: _titleTabColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(child: Text(_titleCaption, style: feedTopHeaderStyle(context))),
                  Text(widget.postNo ?? '', style: feedTopHeaderMinorStyle(context)),
                ],
              )
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(  // Feed Title
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: Text(widget.feedTitle ?? '', style: feedHeaderStyle(context))),
                      verticalSpace(10.0),
                      Icon(Icons.bookmark_border, color: WholayColors.primary, size: WholaySpace.headIconSize),
                    ],
                  ),
                  Text('ประกาศ ' + formatDate(widget.postDate ?? DateTime.now(), [d, '/', mm, '/', yyyy, ' ',  HH, ':',  nn]), style: feedSubminorGeneralStyle(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_requiredCaption + ' ' + formatDate(widget.requiredTo ?? DateTime.now(), [d, '/', mm, '/', yyyy]), style: feedSubminorPrimaryStyle(context)),
                      Visibility(
                        visible: (widget.feedsType == FeedsType.recipient),
                        child: Text(_urgentStr, style: feedMinorEmphasizeStyle(context, _urgentColor)),
                      ),                                                  
                    ],
                  ),
                  verticalSpace(10.0),
                  Text(widget.feedContent, maxLines: 3, softWrap: false, overflow: TextOverflow.ellipsis),
                  verticalSpace((widget.feedPics != null && widget.feedPics.isNotEmpty && widget.feedPics.length > 0) ? 20.0 : 10.0),
                  Visibility(
                    visible: (widget.feedPics != null && widget.feedPics.isNotEmpty && widget.feedPics.length > 0),
                    child: SizedBox(
                      height: 200.0,
                      width: double.maxFinite,
                      child: (widget.feedPics != null && widget.feedPics.isNotEmpty && widget.feedPics.length > 0) 
                      ? ListView.builder(
                        scrollDirection: Axis.horizontal,                        
                        itemCount: widget.feedPics.length,
                        itemBuilder: (context, idx) {
                          return widget.feedPics[idx];
                        },
                      ) : null,
                    ),
                  ),
                  Visibility(
                    visible: (widget.feedPics != null && widget.feedPics.isNotEmpty && widget.feedPics.length > 0),
                    child: verticalSpace(10.0),  
                  ),                  
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('รายละเอียดเพิ่มเติม...', style: feedSubminorGeneralStyle(context)),
                  ),
                ],
              ),
            ),
            verticalSpace(5.0),
            lineDivide(WholayColors.controlFixBorder),
            verticalSpace(10.0),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              // padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child:  UserAvatar(
                        nameFontColor: WholayColors.textPrimary,
                        mottoFontColor: WholayColors.textSecondary,
                        levelFontColor: WholayColors.textSecondary,
                        scoreFontColor: WholayColors.textDataSecondary,
                        memberDateFontColor: WholayColors.textDataGeneral,
                        avatarPosition: AvatarPosition.Left,
                        avatarGap: 10.0,
                        showAvatarBorder: false,
                        showShadowName: false,
                        showShadowMotto: false,
                        showShadowLevel: false,
                        showShadowMemberDate: false,
                        showMotto: false,
                        showIconLevel: true,
                        showMemberDate: false,
                        avatarRadius: 30.0,
                        nameFontSize: 16.0,
                        levelFontSize: 12.0,
                        levelIconSize: 20.0,   
                        scoreFontSize: 11.0,
                        scoreIconSize: 20.0,
                        memberDateFontSize: 10.5,
                        nameLimitedWidth: _scrWdt / 2.5,
                        levelLimitedWidth: _scrWdt / 3.0,
                        memberDateLimitedWidth: _scrWdt / 2.3,
                        displayName: widget.ownerName ?? '',
                        userLevel: widget.ownerLevel ?? 1,
                        memberDate: widget.ownerMemberDate,
                        scoreValue: widget.ownerScore ?? 0,
                        showScore: true,
                        showShadowScore: false,
                        avatarImage: widget.ownerAvatar,
                      ),
                  ),
                  horizontalSpace(4.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      // Text('2.4 กม.', style: controlLabelStyle(context)),
                      Text('ช่วยเหลือผู้อื่น ${widget.ownerVolunteerScore}', style: feedMinorGeneralStyle(context)),
                      Text('ผู้อื่นช่วยเหลือ ${widget.ownerRecipientScore}', style: feedMinorGeneralStyle(context)),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(10.0),
            lineDivide(WholayColors.controlFixBorder),
            // verticalSpace(8.0),
            Container(
              color: WholayColors.controlLightBackground,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.solidThumbsUp, color: ((widget.likeScore ?? 0) > 0) ? WholayColors.primary : Colors.blueGrey[100]),
                      horizontalSpace(((widget.likeScore ?? 0) > 0) ? 5.0 : 15.0),
                      Visibility(
                        visible: widget.likeScore > 0,
                        child: Text('${widget.likeScore}', style: feedSubminorSecondaryStyle(context, textSize: Theme.of(context).textTheme.subhead.fontSize - 7)),
                      ),                          
                    ],
                  ),
                  Text(
                    ((widget.opinionNo == null) || (widget.opinionNo == 0)) ? 'ไม่มีความคิดเห็น' : '${widget.opinionNo} ความคิดเห็น', 
                    style: feedSubminorSecondaryStyle(context)
                  ),
                  Text(
                    'สมัคร : ${widget.volunteerNo ?? 0}, อนุมัติ : ${widget.volunteerApprovalNo}',
                    style: feedSubminorSecondaryStyle(context)
                  ),
                ],
              ),
            ),
            // verticalSpace(8.0),
            lineDivide(WholayColors.controlFixBorder),
            verticalSpace(8.0),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.thumbsUp, color: WholayColors.primary),
                      horizontalSpace(7.0),
                      Text('ถูกใจ', style: feedSubminorSecondaryStyle(context)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.commentAlt, color: WholayColors.primary),
                      horizontalSpace(7.0),
                      Text('ความคิดเห็น', style: feedSubminorSecondaryStyle(context)),
                    ],
                  ),
                  Container(
                    width: 150.0,
                    height: 38.0,
                    decoration: BoxDecoration(
                      color: _mainButtonColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: (widget.feedsType == FeedsType.recipient) ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Visibility(
                          visible: (widget.feedsType == FeedsType.recipient),
                          child: Icon(FontAwesomeIcons.handHoldingHeart, color: Colors.white, size: 20.0),
                        ),                            
                        Text(_mainButtonCaption, style: feedSubminorButtonStyle(context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),                
            verticalSpace(8.0),
            lineDivide(WholayColors.controlBorder),
          ],
        ),      
    );
  }
}

TextStyle feedTopHeaderStyle(BuildContext context) => TextStyle(
  color: Colors.white,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize,
  fontWeight: FontWeight.w600,
  letterSpacing: 1.0
);

TextStyle feedTopHeaderMinorStyle(BuildContext context) => TextStyle(
  color: Colors.white70,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize - 6,
);

TextStyle feedHeaderStyle(BuildContext context) => TextStyle(
  color: WholayColors.textPrimary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize + 2,
  fontWeight: FontWeight.normal,
);

TextStyle feedMinorGeneralStyle(BuildContext context) => TextStyle(
  color: WholayColors.textSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize - 3.5,
);

TextStyle feedSubminorGeneralStyle(BuildContext context) => TextStyle(
  color: WholayColors.textSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize - 5,
  fontWeight: FontWeight.normal,
);

TextStyle feedSubminorPrimaryStyle(BuildContext context) => TextStyle(
  color: WholayColors.textPrimary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize - 5,
  fontWeight: FontWeight.w600,
);

TextStyle feedSubminorSecondaryStyle(BuildContext context, {double textSize}) => TextStyle(
  color: WholayColors.textSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: ((textSize != null) && ((textSize ?? 0.0) > 0.0)) ? textSize : Theme.of(context).textTheme.subhead.fontSize - 5,
  fontWeight: FontWeight.w600,
);

TextStyle feedSubminorButtonStyle(BuildContext context) => TextStyle(
  color: Colors.white,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize - 4,
  fontWeight: FontWeight.w600,
);

TextStyle feedMinorEmphasizeStyle(BuildContext context, Color fontColor) => TextStyle(
  color: fontColor,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize - 2,
  fontWeight: FontWeight.bold,
);
