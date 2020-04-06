import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';

class AddressInput extends StatefulWidget {
  @override
  _AddressInputState createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  @override
  Widget build(BuildContext context) {
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
        ),
        DropdownInput(
          readonly: true,
          showUpperLabel: false,
          labelCaption: 'ตำบล / แขวง',
          labelText: 'ตำบล / แขวง',
          hintText: 'ตำบล / แขวง',
          lowerSpace: WholaySpace.controlVertical,
        ),
        DropdownInput(
          readonly: true,
          showUpperLabel: false,
          labelCaption: 'อำเภอ / เขต',
          labelText: 'อำเภอ / เขต',
          hintText: 'อำเภอ / เขต',
          lowerSpace: WholaySpace.controlVertical,
        ),
        DropdownInput(
          readonly: true,
          showUpperLabel: false,
          labelCaption: 'จังหวัด',
          labelText: 'จังหวัด',
          hintText: 'จังหวัด',
          lowerSpace: WholaySpace.controlVertical,
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}