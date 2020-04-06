import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/rendering.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/widgets/locationAddressWidget.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:wholay/validator.dart';
// import 'package:dropdownfield/dropdownfield.dart';
// import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:wholay/widgets/userProfile/userProfileWidget.dart';

class PageMenus {
  static const String saveMenu = 'บันทึกข้อมูล';
  static const String clearMenu = 'ล้างข้อมูล';

  static const List<String> menus = <String>[
    saveMenu,
    clearMenu,
  ];
}

class UserAcctRegistDetailEntryPage extends StatefulWidget {
  UserAcctRegistDetailEntryPage({
    Key key,
    this.pageTitle = 'บัญชีผู้ใช้งาน',
  }) : super(key: key);

  final String pageTitle;

  @override
  _UserAcctRegistDetailEntryPageState createState() =>
      _UserAcctRegistDetailEntryPageState();
}

class _UserAcctRegistDetailEntryPageState
    extends State<UserAcctRegistDetailEntryPage> {
  // Explicit

  String firstName;
  String lastName;

  String gender; // m = male; f = female
  String race;
  String nationality;
  String religion;
  DateTime birthdate;
  bool showAge = true;
  bool showBirthdate = true;
  String docCountry;
  String docType;
  String docNo;
  DateTime docExpire;

  String addrNo;
  String addrPlace;
  String addrRoad;
  String addrTumbol;
  String addrAmphor;
  String addrProvince;
  String addrZipCode;
  String addrCountry;

  // Master UNG
  final _formKey = GlobalKey<FormState>();
  // var thaiIDController = MaskedTextController(mask: '0-0000-00000-00-0');
  final _raceController = TextEditingController();
  final _nationalController = TextEditingController();
  final _religionController = TextEditingController();

  var _showBirthFormats = ['วัน เดือน ปี', 'เดือน ปี', 'ปี'];
  String _selectedBirthFormat = 'เดือน ปี';

  void menuAction(String menu) {}

  @override
  void dispose() {
    // TODO: implement dispose
    _raceController.dispose();
    _nationalController.dispose();
    _religionController.dispose();
    super.dispose();
  }

  Widget myAddressInput() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: InputWithLabel(
                showUpperLabel: false,
                labelCaption: 'เลขที่',
                labelText: 'เลขที่',
                hintText: 'เลขที่',
                onSaved: (String value) {
                  addrNo = value;
                },
              ),
            ),
            horizontalSpace(4.0),
            Expanded(
              flex: 2,
              child: InputWithLabel(
                showUpperLabel: false,
                labelCaption: 'หมู่บ้าน / อาคาร',
                labelText: 'หมู่บ้าน / อาคาร',
                hintText: 'หมู่บ้าน / อาคาร',
                onSaved: (String value) {
                  addrPlace = value;
                },
              ),
            ),
          ],
        ),
        verticalSpace(WholaySpace.controlVertical),
        DropdownInput(
          readonly: false,
          showUpperLabel: false,
          labelCaption: 'ถนน',
          labelText: 'ถนน',
          hintText: 'ถนน',
          lowerSpace: WholaySpace.controlVertical,
          onSaved: (String value) {
            addrRoad = value;
          },
        ),
        DropdownInput(
          readonly: true,
          showUpperLabel: false,
          labelCaption: 'ตำบล / แขวง',
          labelText: 'ตำบล / แขวง',
          hintText: 'ตำบล / แขวง',
          lowerSpace: WholaySpace.controlVertical,
          onSaved: (String value) {
            addrTumbol = value;
          },
        ),
        DropdownInput(
          readonly: true,
          showUpperLabel: false,
          labelCaption: 'อำเภอ / เขต',
          labelText: 'อำเภอ / เขต',
          hintText: 'อำเภอ / เขต',
          lowerSpace: WholaySpace.controlVertical,
          onSaved: (String value) {
            addrAmphor = value;
          },
        ),
        DropdownInput(
          readonly: true,
          showUpperLabel: false,
          labelCaption: 'จังหวัด',
          labelText: 'จังหวัด',
          hintText: 'จังหวัด',
          lowerSpace: WholaySpace.controlVertical,
          onSaved: (String value) {
            addrProvince = value;
          },
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: InputWithLabel(
                keyboardType: TextInputType.number,
                showUpperLabel: false,
                labelCaption: 'รหัสไปรษณีย์',
                labelText: 'รหัสไปรษณีย์',
                hintText: 'รหัสไปรษณีย์',
                onSaved: (String value) {
                  addrZipCode = value;
                },
              ),
            ),
            horizontalSpace(4.0),
            Expanded(
              flex: 1,
              child: DropdownInput(
                readonly: true,
                enabled: false,
                showUpperLabel: false,
                labelCaption: 'ประเทศ',
                labelText: 'ประเทศไทย',
                hintText: 'ประเทศไทย',
                onSaved: (String value) {
                  addrCountry = value;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    void saveForm() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        // Navigator.pop(context);

        // Master UNG
        print('addrCountry = $addrCountry');
      }
    }

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
            onPressed: () {
              saveForm();
            },
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
            title: Row(
              children: <Widget>[
                Text(
                  'ข้อมูลเอกสารสำคัญ / ที่อยู่',
                  style: secondaryAppBarTitleStyle(),
                ),
                horizontalSpace(20.0),
                WaitingIcon(), // If ready info show CheckRightIcon else WaitingIcon
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: WholaySpace.edgeHorizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      verticalSpace(30.0),
                      Text(
                        'เมื่อคุณให้ข้อมูลเอกสารสำคัญข้างล่างนี้อย่างครบถ้วน คุณจะได้เลื่อนระดับสถานะบัญชีผู้ใช้ของคุณเป็นระดับที่ 3 '
                        '(3 โบว์) เพื่อให้ผู้ใช้คนอื่นๆ เห็นว่า บัญชีผู้ใช้ของคุณมีความน่าเชื่อถือ',
                        style: minorLabelStyle(context),
                      ),
                      verticalSpace(40.0),
                      Text(
                        'ชื่อ - นามสกุล',
                        style: primaryHeaderLabelStyle(context),
                      ),
                      verticalSpace(WholaySpace.controlVertical),
                      InputWithLabel(
                        labelCaption: 'ชื่อ',
                        labelText: 'ชื่อจริง',
                        hintText: 'ชื่อตามเอกสารสำคัญ',
                        showUpperLabel: true,
                        required: true,
                        requiredErrorText: 'กรุณาระบุชื่อของคุณ',
                        lowerSpace: WholaySpace.controlVertical,
                        onSaved: (String value) {
                          firstName = value;
                        },
                      ),
                      InputWithLabel(
                        labelCaption: 'นามสกุล',
                        labelText: 'นามสกุลจริง',
                        hintText: 'นามสกุลตามเอกสารสำคัญ',
                        showUpperLabel: true,
                        required: true,
                        requiredErrorText: 'กรุณาระบุนามสกุลของคุณ',
                        lowerSpace: WholaySpace.controlVertical,
                        onSaved: (String value) {
                          lastName = value;
                        },
                      ),
                      // DropdownInput(
                      //   labelCaption: 'แสดง',
                      //   labelText: 'ชื่อ - นามสกุล',
                      //   hintText: '',
                      //   showUpperLabel: true,
                      //   required: false,
                      //   readonly: true,
                      //   performListSearch: false,
                      //   dataList: ['ชื่อ - นามสกุล', 'นามสกุล - ชื่อ'],
                      //   lowerSpace: WholaySpace.controlVerticalLoose,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('เพศ', style: controlLabelStyle(context)),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 'M',
                                groupValue: 'SEX',
                                onChanged: (value) {
                                  gender = value;
                                },
                              ),
                              Text('ชาย', style: controlLabelStyle(context)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 'F',
                                groupValue: 'SEX',
                                onChanged: (value) {
                                  gender = value;
                                },
                              ),
                              Text('หญิง', style: controlLabelStyle(context)),
                            ],
                          ),
                        ],
                      ),
                      // verticalSpace(WholaySpace.controlVerticalLoose),
                      verticalSpace(30.0),
                      Text(
                        'เชื้อชาติ - สัญชาติ - ศาสนา',
                        style: primaryHeaderLabelStyle(context),
                      ),
                      verticalSpace(WholaySpace.controlVertical),
                      DropdownInput(
                        controller: _raceController,
                        labelCaption: 'เชื้อชาติ',
                        labelText: 'ไทย',
                        hintText: '',
                        showUpperLabel: true,
                        required: false,
                        readonly: false,
                        performListSearch: true,
                        dataList: ['ไทย', 'พม่า', 'ลาว'],
                        lowerSpace: WholaySpace.controlVertical,
                        onSaved: (String value) {
                          race = value;
                        },
                      ),
                      DropdownInput(
                        controller: _nationalController,
                        labelCaption: 'สัญชาติ',
                        labelText: 'ไทย',
                        hintText: '',
                        showUpperLabel: true,
                        required: false,
                        readonly: false,
                        performListSearch: true,
                        dataList: ['ไทย'],
                        lowerSpace: WholaySpace.controlVertical,
                        onSaved: (String value) {
                          nationality = value;
                        },
                      ),
                      DropdownInput(
                        controller: _religionController,
                        labelCaption: 'ศาสนา',
                        labelText: 'พุทธ',
                        hintText: '',
                        showUpperLabel: true,
                        required: false,
                        readonly: false,
                        performListSearch: true,
                        dataList: [
                          'พุทธ',
                          'คริสต์',
                          'อิสลาม',
                          'ไม่นับถือศาสนา'
                        ],
                        onSaved: (String value) {
                          religion = value;
                        },
                      ),
                      verticalSpace(30.0),
                      Text(
                        'วันเกิด',
                        style: primaryHeaderLabelStyle(context),
                      ),
                      verticalSpace(WholaySpace.controlVertical),
                      DateInput(
                        dateValue: birthdate,
                        labelCaption: 'วันเกิด',
                        showUpperLabel: false,
                        lowerSpace: WholaySpace.controlVertical,
                        onSaved: (String value) {
                          // print('value Daet ==> $value');
                          DateTime dateTime = DateTime.now();
                          birthdate = dateTime;
                          // print('birthdate ==> $birthdate');
                        },
                      ),
                      verticalSpace(WholaySpace.controlVertical),
                      SwitchLabelInput(
                        labelText: 'แสดงอายุให้ผู้อื่นเห��น',
                        value: true,
                        onChanged: (value) {
                          showAge = value;
                        },
                      ),
                      SwitchLabelInput(
                        labelText: 'แสดงวันเกิดให้ผู้อื่นเห็น',
                        value: true,
                        onChanged: (value) {
                          showBirthdate = value;
                        },
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: _selectedBirthFormat,
                          items: _showBirthFormats
                              .map<DropdownMenuItem<String>>((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedBirthFormat = newValue;
                              print(
                                  '_selectedBirthFormat = $_selectedBirthFormat');
                            });
                          },
                        ),
                      ),
                      // DropdownInput(
                      //   labelCaption: 'รูปแบบ',
                      //   labelText: 'เดือน ปี',
                      //   hintText: '',
                      //   showUpperLabel: true,
                      //   required: false,
                      //   readonly: true,
                      //   performListSearch: false,
                      //   dataList: ['วัน เดือน ปี', 'เดือน ปี', 'ปี'], // DMY, MY, Y
                      // ),
                      verticalSpace(30.0),
                      Text(
                        'ข้อมูลบัตรสำคัญ',
                        style: primaryHeaderLabelStyle(context),
                      ),
                      verticalSpace(WholaySpace.controlVertical),
                      DropdownInput(
                        labelCaption: 'ประเทศผู้ออกเอกสาร',
                        labelText: 'ไทย',
                        hintText: '',
                        showUpperLabel: true,
                        required: true,
                        readonly: false,
                        performListSearch: true,
                        dataList: ['ไทย'],
                        lowerSpace: WholaySpace.controlVertical,
                        onSaved: (String value) {
                          docCountry = value;
                        },
                      ),
                      DropdownInput(
                        labelCaption: 'ประเภทเอกสาร',
                        labelText: 'บัตรประชาชน',
                        hintText: '',
                        showUpperLabel: true,
                        required: false,
                        readonly: true,
                        performListSearch: false,
                        dataList: ['บัตรประชาชน', 'หนังสือเดินทาง'],
                        lowerSpace: WholaySpace.controlVertical,
                        onSaved: (String value) {
                          docType = value;
                        },
                      ),
                      InputWithLabel(
                        // controller: thaiIDController,
                        labelCaption: 'เลขที่เอกสารสำคัญ',
                        labelText: 'เลขที่เอกสารสำคัญ',
                        hintText: 'เลขที่เอกสารสำคัญ',
                        keyboardType:
                            TextInputType.numberWithOptions(signed: false),
                        showUpperLabel: true,
                        required: true,
                        inputFormatMask: 'X-XXXX-XXXXX-XX-X',
                        inputFormatSeparator: '-',
                        requiredErrorText: 'กรุณาระบุหมายเลขเอกสารสำคัญ',
                        lowerSpace: WholaySpace.controlVertical,
                        validator: (value) {
                          Checker checker = Checker();
                          checker.value = value;
                          if (!checker.isBlank) if (!checker
                              .isValidThaiNationalityID)
                            return 'เลขบัตรประชาชนไม่ถูกต้อง กรุณาตรวจสอบ';
                        },
                        onSaved: (String value) {
                          docNo = value;
                        },
                      ),
                      DateInput(
                        labelCaption: 'วันที่หมดอายุ',
                        showUpperLabel: true,
                        onSaved: (String value) {
                          DateTime dateTime = DateTime.now();
                          docExpire = dateTime;
                        },
                      ),
                      verticalSpace(30.0),
                      Text(
                        'ที่อยู่ตามทะเบียน',
                        style: primaryHeaderLabelStyle(context),
                      ),
                      verticalSpace(WholaySpace.controlVertical),
                      // AddressInput(),
                      myAddressInput(),
                      SaveFullWidthButton(
                        upperSpace: 50.0,
                        lowerSpace: 60.0,
                        onPressed: () {
                          saveForm();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
