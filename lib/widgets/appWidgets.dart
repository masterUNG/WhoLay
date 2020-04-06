import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/validator.dart';
import 'package:date_format/date_format.dart';
import 'package:masked_text_input_formatter/masked_text_input_formatter.dart';
// import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

const double edgeHorizontalSpace = 20.0;
const double controlHorizontalSpace = 8.0;
const double controlVerticalSpace = 8.0;
const double controlButtonHeight = 54.0;
const double controlInputHeight = 57.0;
const double controlBorderSize = 3.0;
const double controlcircleRadius = 30.0;
const double controlLabelVerticalspace = 2.0;
const double controlVerticalLooseSpace = 20.0;
const double controlButtonVerticalSpace = 30.0;
const double controlHeadIconSize = 36.0;
const double profileBackgroundVerticalSpace = 340.0;
const double controlTitleBarHeight = 52.0;
const double minimumScreenWidth = 380;
const double standardScreenWidth = 442;

class WholaySpace {
  static const double edgeHorizontal = edgeHorizontalSpace;
  static const double controlHorizontal = controlHorizontalSpace;
  static const double controlVertical = controlVerticalSpace;
  static const double buttonHeight = controlButtonHeight;
  static const double inputHeight = controlInputHeight;
  static const double borderSize = controlBorderSize;
  static const double circleRadius = controlcircleRadius;
  static const double controlLabelVertical = controlLabelVerticalspace;
  static const double controlVerticalLoose = controlVerticalLooseSpace;
  static const double controlButtonVertical = controlButtonVerticalSpace;
  static const double headIconSize = controlHeadIconSize;
  static const double profileBackgroundHeight = profileBackgroundVerticalSpace;
  static const double titleBarHeight = controlTitleBarHeight;
  static const double minScreenWidth = minimumScreenWidth;
  static const double stdScreenWidth = standardScreenWidth;
}

Widget horizontalSpace(double size) => SizedBox(width: size == null ? controlHorizontalSpace : size);
Widget verticalSpace(double size) => SizedBox(height: size == null ? controlVerticalSpace : size);
Widget lineDivide(Color color) => Divider(height: 1.0, color: color == null ? WholayColors.primary : color);
Widget lineDivideFader() => Divider(height: 1.0, color: WholayColors.controlBorder);

Widget arrowRightIcon() {
  return Icon(
    Icons.chevron_right,
    color: WholayColors.primary,
    size: WholaySpace.headIconSize,
  );
}

class BackPageIcon extends StatelessWidget {

  final double size;
  final Color iconColor;

  BackPageIcon({
    Key key,
    this.size,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_back, // or Icons.arrow_back_ios
      size: size,
      color: iconColor,
    );
  }
}

class ClosePageIcon extends StatelessWidget {

  final double size;
  final Color iconColor;

  ClosePageIcon({
    Key key,
    this.size = 32.0,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.close,
      size: size,
      color: iconColor,
    );
  }
}

class ErrorIcon extends StatelessWidget {

  final double size;

  ErrorIcon({
    Key key,
    this.size = 32.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.error, color: Colors.red[800], size: size);
  }
}

class WarningIcon extends StatelessWidget {

  final double size;

  WarningIcon({
    Key key,
    this.size = 32.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.error, color: WholayColors.warningTab, size: size);
  }
}

class CheckRightIcon extends StatelessWidget {

  final double size;

  CheckRightIcon({
    Key key,
    this.size = 32.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.check_circle, color: Colors.green[700], size: size);
  }
}

class WaitingIcon extends StatelessWidget {

  final double size;

  WaitingIcon({
    Key key,
    this.size = 32.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.watch_later, color: Colors.lightBlue[600], size: size);
  }
}


// Wholay Brand ----------------------------------------------------------------------------------

Widget wholayLogoContainer({double width = 100.0, double height = 100.0}) {
  return  
    Center(
      child: Image(
        image: AssetImage('imgs/wholay_logo_100x100.png'),
        width: width,
        height: height,
      ),
    ); 
}

Widget wholayBrandCaption({double fontsize = 54.0}) {
  return 
    Text(
      'Wholay',
      style: TextStyle(
        // fontFamily: 'Roboto', 
        fontFamily: 'BalooBhai',
        fontSize: fontsize, 
        // fontWeight: FontWeight.w700, 
        color: WholayColors.textPrimary
      ),
    );
}

Widget wholayBrandMotto({double fontsize = 20.0}) {
  return Text(
    'my service mind',
    style: TextStyle(
      fontFamily: 'Lato', 
      fontSize: fontsize, 
      fontWeight: FontWeight.normal, 
      color: WholayColors.textPrimary,
      letterSpacing: 1.0,
    ),
  );
}

Widget wholayBrandHeader({
  double logoWidth = 100.0,
  double logoHeight = 100.0,
  double captionFontsize = 50.0,
  double mottoFontsize = 19.0
}) {
  return Column(
    children: <Widget>[
      wholayLogoContainer(width: logoWidth, height: logoHeight),
      verticalSpace(10.0),
      wholayBrandCaption(fontsize: captionFontsize),
      wholayBrandMotto(fontsize: mottoFontsize)
    ],
  );
}

Widget wholayBrandHeaderLandscape() {
  return Row(
    children: <Widget>[
      wholayLogoContainer(),
      horizontalSpace(20.0),
      Column(
        children: <Widget>[
          wholayBrandCaption(),
          wholayBrandMotto()
        ],
      )
    ]
  );
}

// ^ Wholay Brand ------------------------------------------------------------------------------------------------------------


class SocialButtonBar extends StatelessWidget {

  final double barHeight;
  final Color buttonColor;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onPressedFacebook;
  final VoidCallback onPressedGoogle;
  final VoidCallback onPressedLine;

  SocialButtonBar({Key key, this.barHeight, this.buttonColor, this.iconColor, this.backgroundColor, 
                    this.onPressedFacebook, this.onPressedGoogle, this.onPressedLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _scrWdt = MediaQuery.of(context).size.width;
    double _circleRadius = (_scrWdt < WholaySpace.minScreenWidth) ? 26.0 : WholaySpace.circleRadius;

    return Container(
      height: barHeight,
      color: backgroundColor,
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: CircleIconButton(
                icon: Icon(FontAwesomeIcons.facebookF),
                iconColor: iconColor,
                buttonColor: buttonColor,
                radius: _circleRadius,
                onPressed: onPressedFacebook,
              ),
            ),
          ),
          Expanded( 
            child: Center(
              child: CircleIconButton(
                icon: Icon(FontAwesomeIcons.google),
                iconColor: iconColor,
                buttonColor: buttonColor,
                radius: _circleRadius,
                onPressed: onPressedGoogle,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: CircleIconButton(
                icon: Icon(FontAwesomeIcons.line),
                iconColor: iconColor,
                buttonColor: buttonColor,
                radius: _circleRadius,
                onPressed: onPressedLine,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {

  final Icon icon;
  final Color buttonColor;
  final Color iconColor;
  final double radius;
  final VoidCallback onPressed;
  final bool showShadow;
  final Color shadowColor;
  final double shadowRadius;
  final double shadowOffset;

  CircleIconButton({Key key, this.icon, this.buttonColor, this.iconColor, this.radius, this.onPressed, 
                    this.showShadow, this.shadowColor, this.shadowRadius, this.shadowOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color _buttonColor = WholayColors.primary;
    Color _iconColor = Colors.white;
    double _radius = WholaySpace.circleRadius;
    bool _showShadow = false;
    Color _shadowColor = Colors.black45;
    double _shadowRadius = 4.0;
    double _shadowOffset = 0;

    _buttonColor = buttonColor != null ? buttonColor : _buttonColor;
    _iconColor = iconColor != null ? iconColor : _iconColor;
    _radius = radius != null ? radius : _radius;
    _showShadow = showShadow != null ? showShadow : _showShadow;
    _shadowColor = shadowColor != null ? shadowColor : _shadowColor;
    _shadowRadius = shadowRadius != null ? shadowRadius : _shadowRadius;
    _shadowOffset = shadowOffset != null ? shadowOffset : _shadowOffset;

    return 
      _showShadow ?
        Container(
          width: _radius * 2,
          height: _radius * 2,
          decoration: BoxDecoration(
            color: _buttonColor,
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: _shadowColor,
                blurRadius: _shadowRadius,
                offset: Offset(_shadowOffset, _shadowOffset),
              ),
            ],
          ),
          child: IconButton(
            icon: icon,
            color: _iconColor,
            onPressed: onPressed,
          ),
        )
      :
        Container(
          width: _radius * 2,
          height: _radius * 2,
          decoration: BoxDecoration(
            color: _buttonColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: icon,
            color: _iconColor,
            onPressed: onPressed,
          ),
        );
  }
}

class ForgotPasswordIconLabel extends StatelessWidget {

  final String caption;
  final Color backgroundColor;
  final Color highlightColor;
  final Color splashColor;
  final Color iconColor;
  final Color labelColor;
  final VoidCallback onPressed;

  ForgotPasswordIconLabel({
    Key key,
    this.caption = 'ลืมรหัสผ่าน',
    this.backgroundColor,
    this.highlightColor,
    this.splashColor,
    this.iconColor,
    this.labelColor,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color _iconColor = (iconColor == null) ? WholayColors.textBackgroundMain : iconColor;
    Color _labelColor = (labelColor == null) ? WholayColors.textBackgroundMain : labelColor;
    double _scrWdt = MediaQuery.of(context).size.width;
    double _fontsize = (_scrWdt < WholaySpace.minScreenWidth) ? 10.0 : 12.0;
    double _height = (_scrWdt < WholaySpace.minScreenWidth) ? 20.0 : 24.0;

    return Container(
      height: _height,
      alignment: Alignment.bottomRight,
      child: FlatButton.icon(
        color: backgroundColor, // WholayColors.backgroundMain, 
        highlightColor: highlightColor, // WholayColors.backgroundMain,
        splashColor: splashColor, // WholayColors.backgroundMain,
        icon: Icon(Icons.help, color: _iconColor),
        label: Text(caption, style: TextStyle(fontSize: _fontsize, color: _labelColor)),
        onPressed: onPressed,
      ),
    );
  }
}

// ----- input ---------------------------------------------------------------------------------------

class InputWithLabel extends StatefulWidget {

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelCaption;
  final String labelText;
  final String hintText;
  final String inputFormatMask;
  final String inputFormatSeparator;
  final String initialValue;
  final Widget prefixIcon;
  final Widget subfixIcon;
  final Color readOnlyBackgroundColor;
  final bool hasFloatingPlaceholder;
  final bool readonly;
  final bool enabled;
  final bool required;
  final bool showUpperLabel;
  final String requiredErrorText;
  final double  upperSpace;
  final double  lowerSpace;
  final int maxLength;
  final bool maxLengthEnforced;
  final int maxLines;
  final bool expands;
  final VoidCallback onSuffixIconPressed;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  InputWithLabel({
    Key key, 
    this.controller,
    this.keyboardType,
    this.labelCaption = 'label caption',
    this.labelText = 'label text',
    this.hintText = '',
    this.inputFormatMask,
    this.inputFormatSeparator,
    this.initialValue,
    this.prefixIcon,
    this.subfixIcon,
    this.readOnlyBackgroundColor,
    this.hasFloatingPlaceholder = false,
    this.readonly = false,
    this.enabled = true,
    this.required = false,
    this.showUpperLabel = false,
    this.requiredErrorText = 'กรุณากำหนดค่า ช่องข้อมูลนี้ไม่สามารถเป็นค่าว่างได้',
    this.upperSpace = 0,
    this.lowerSpace = 0,
    this.maxLength,
    this.maxLengthEnforced = false,
    this.maxLines = 1,
    this.expands = false,
    this.onSuffixIconPressed,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator
  }) : super(key: key);

  @override
  _InputWithLabelState createState() => _InputWithLabelState();
}

class _InputWithLabelState extends State<InputWithLabel> {
  @override
  Widget build(BuildContext context) {    

    Color _readOnlyBGColor = (widget.readOnlyBackgroundColor == null) ? WholayColors.controlFixBackground : widget.readOnlyBackgroundColor;

    return Column(
      children: <Widget>[
        verticalSpace(widget.upperSpace),
        Visibility(
          visible: widget.showUpperLabel,
          child: Column(
            children: <Widget>[            
              Align(
                alignment: Alignment.topLeft, 
                child: Text(
                  widget.labelCaption,
                  style: controlLabelStyle(context),
                ),            
              ),
              verticalSpace(WholaySpace.controlLabelVertical),
            ],
          ),
        ),
        (widget.readonly) ?
          GestureDetector(
            onTap: widget.onSuffixIconPressed,
            child: Container(
              height: WholaySpace.inputHeight,
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),          
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Visibility(
                        visible: (widget.prefixIcon != null),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: widget.prefixIcon,
                        ),
                      ),
                      Visibility(
                        visible: (widget.prefixIcon != null),
                        child: horizontalSpace(14.0),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          (widget.controller != null) ? widget.controller.text : ((widget.labelText != null) ? widget.labelText : null),
                          style: TextStyle(
                            fontFamily: Theme.of(context).textTheme.subhead.fontFamily,
                            fontSize: Theme.of(context).textTheme.subhead.fontSize,
                            fontStyle: Theme.of(context).textTheme.subhead.fontStyle,
                            fontWeight: Theme.of(context).textTheme.subhead.fontWeight,
                            color: WholayColors.textDataGeneral
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: (widget.subfixIcon != null),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: widget.subfixIcon,
                    ),
                  ),
                ],
              ), 
              decoration: BoxDecoration(
                color: _readOnlyBGColor,
                border: Border.all(
                  width: 1.3,
                  color: WholayColors.controlFixBorder,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),        
            ),
          )
        :
          TextFormField(           
            controller: widget.controller,     
            keyboardType: widget.keyboardType,
            enabled: widget.enabled,            
            initialValue: widget.initialValue,
            maxLength: widget.maxLength,
            maxLengthEnforced: widget.maxLengthEnforced,
            maxLines: widget.maxLines,
            expands: widget.expands,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,            
            inputFormatters: (widget.inputFormatMask != null) ?
              [
                MaskedTextInputFormatter(
                  mask: widget.inputFormatMask,
                  separator: (widget.inputFormatSeparator) ?? '',
                )
              ] : null,
            validator: (value) {
              var checker = Checker();
              checker.value = value;
              if (widget.required && checker.isBlank)
                return widget.requiredErrorText;
              else if (widget.validator != null)
                return widget.validator(value);
            },
            decoration: InputDecoration(
              enabled: widget.enabled,
              labelText: widget.labelText,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: (widget.onSuffixIconPressed == null) ? widget.subfixIcon :
                IconButton(
                  icon: widget.subfixIcon,
                  onPressed: widget.onSuffixIconPressed,
                ),
              hasFloatingPlaceholder: widget.hasFloatingPlaceholder,
            ),
          ),
        verticalSpace(widget.lowerSpace),
      ],
    );
  }
}

class DropdownInput extends StatefulWidget {

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelCaption;
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final Widget dropdownIcon;
  final bool hasFloatingPlaceholder;
  final bool readonly;
  final bool enabled;
  final bool required;
  final bool showUpperLabel;
  final bool canEditText;
  final bool performListSearch;
  final String requiredErrorText;
  final double  upperSpace;
  final double  lowerSpace;
  final List<String> dataList;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  DropdownInput({
    Key key, 
    this.controller,
    this.keyboardType,
    this.labelCaption = 'label caption',
    this.labelText = 'label text',
    this.hintText = '', 
    this.prefixIcon,
    this.dropdownIcon,
    this.hasFloatingPlaceholder = false,
    this.readonly = false,
    this.enabled = true,
    this.required = false,
    this.showUpperLabel = false,
    this.canEditText = false,
    this.performListSearch = true,
    this.requiredErrorText = 'กรุณากำหนดค่า ช่องข้อมูลนี้ไม่สามารถเป็นค่าว่างได้',
    this.upperSpace = 0,
    this.lowerSpace = 0,
    this.dataList,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator
  }) : super(key: key);

  @override
  _DropdownInputState createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {

  String _selectItem;

  @override
  Widget build(BuildContext context) {

    var _dropdownIcon = (widget.dropdownIcon != null) ? widget.dropdownIcon : Icon(Icons.expand_more, size: 32.0, color: Colors.grey[600]);
    _selectItem = (_selectItem == null) ? widget.labelText : _selectItem;

    _navigateSearchPage(BuildContext context) async {
      final selectedItem = await Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => SearchListPage(
          dataList: widget.dataList,
          performSearch: widget.performListSearch,
        ))
      );

      if (selectedItem != null)
        setState(() {
          _selectItem = selectedItem;
          if (widget.controller != null)
            widget.controller.text = _selectItem;
        });
    }

    return ((widget.readonly) && (!widget.performListSearch))
    ? Column(
        children: <Widget>[
          verticalSpace(widget.upperSpace),
          Visibility(
            visible: widget.showUpperLabel,
            child: Column(
              children: <Widget>[            
                Align(
                  alignment: Alignment.topLeft, 
                  child: Text(
                    widget.labelCaption,
                    style: controlLabelStyle(context),
                  ),            
                ),
                verticalSpace(WholaySpace.controlLabelVertical),
              ],
            ),
          ),
          Container(
            height: WholaySpace.inputHeight,
            child: FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    enabled: widget.enabled,
                    labelText: widget.labelText,
                    hintText: widget.hintText,
                    prefixIcon: widget.prefixIcon,
                    hasFloatingPlaceholder: widget.hasFloatingPlaceholder,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: _dropdownIcon,
                      value: _selectItem,
                      items: (widget.dataList != null) 
                      ? widget.dataList.map<DropdownMenuItem<String>>((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontFamily: Theme.of(context).textTheme.subhead.fontFamily,
                                fontSize: Theme.of(context).textTheme.subhead.fontSize,
                                fontStyle: Theme.of(context).textTheme.subhead.fontStyle,
                                fontWeight: Theme.of(context).textTheme.subhead.fontWeight,
                                color: WholayColors.textDataGeneral
                              ),
                            ),
                          );
                        }).toList() : null,
                      onChanged: (String newValue) {
                        setState(() {
                          _selectItem = newValue;
                          if (widget.controller != null) {
                            widget.controller.text = newValue;
                          }
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpace(widget.lowerSpace),
        ],
      )
    : InputWithLabel(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        labelCaption: widget.labelCaption,
        labelText: _selectItem, //  (_selectItem == null) ? widget.labelText : _selectItem,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        subfixIcon: _dropdownIcon,
        hasFloatingPlaceholder: widget.hasFloatingPlaceholder,
        readOnlyBackgroundColor: WholayColors.controlBackground,
        readonly: widget.readonly,
        enabled: widget.enabled,
        required: widget.required,
        showUpperLabel: widget.showUpperLabel,
        requiredErrorText: widget.requiredErrorText,
        upperSpace: widget.upperSpace,
        lowerSpace: widget.lowerSpace,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onSuffixIconPressed: () {
          if (widget.enabled)
            _navigateSearchPage(context);
        },
      );
  }
}

class SearchListPage extends StatefulWidget {

  SearchListPage({
    Key key,
    this.pageTitle = 'เลือก',
    this.dataList,
    this.performSearch = true
  }) : super(key: key);

  final String pageTitle;
  final List<String> dataList;
  final bool performSearch;

  @override
  _SearchListPageState createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  @override
  Widget build(BuildContext context) {

    List<String> _items = widget.dataList;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: BackPageIcon(),  // Icon(Icons.close, size: WholaySpace.headIconSize),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: (!widget.performSearch) ? Text(widget.pageTitle) :
            TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'ค้นหา',
                labelStyle: TextStyle(color: WholayColors.textFader),
                hintText: 'ค้นหา',
                hintStyle: TextStyle(color: WholayColors.textFader),
                filled: false,
                suffixIcon: Icon(Icons.search, color: Colors.white),
                contentPadding: EdgeInsets.only(bottom: 2.0),
                hasFloatingPlaceholder: false,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.0,
                    style: BorderStyle.none,
                    color: WholayColors.primary
                  ),
                ), 
              ),
            ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.check),
        //     onPressed: () {Navigator.pop(context);},
        //   ),
        // ],
      ),
      body: (_items != null) 
        ? ListView.separated(
            itemCount: _items.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_items[index]),
                onTap: () {
                  Navigator.pop(context, _items[index]);
                },
              );
            },
          ) 
        : null,
    );
  }
}

class DateInput extends StatefulWidget {

  final TextEditingController controller;
  final String labelCaption;
  final DateTime dateValue;
  final String hintText;
  final Widget prefixIcon;
  final bool hasFloatingPlaceholder;
  final bool readonly;
  final bool required;
  final bool showUpperLabel;
  final bool canEditText;
  final String requiredErrorText;
  final double  upperSpace;
  final double  lowerSpace;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  DateInput({
    Key key, 
    this.controller,
    this.labelCaption = 'Select Date',
    this.dateValue,
    this.hintText = '', 
    this.prefixIcon,
    this.hasFloatingPlaceholder = false,
    this.readonly = false,
    this.required = false,
    this.showUpperLabel = false,
    this.canEditText = false,
    this.requiredErrorText = 'กรุณากำหนดค่า ช่องข้อมูลนี้ไม่สามารถเป็นค่าว่างได้',
    this.upperSpace = 0,
    this.lowerSpace = 0,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator
  }) : super(key: key);

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {

  DateTime _date;

  Future<void> _selectDate(BuildContext context) async {

    if (widget.controller != null)
      _date = DateTime.parse(widget.controller.text);

    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1800),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            primarySwatch: MaterialColor(WholayColors.blue[500].value, WholayColors.blue),
            textTheme: TextTheme(
              caption: TextStyle(fontFamily: WholayFonts.decoratedFontName, fontWeight: FontWeight.normal, fontSize: 16.0), // use
              body1: TextStyle(fontFamily: WholayFonts.decoratedFontName, fontWeight: FontWeight.normal, fontSize: 14.0), // use
              subhead: TextStyle(fontFamily: WholayFonts.decoratedFontName, fontWeight: FontWeight.normal, fontSize: 16.0),  // use
              button: TextStyle(fontFamily: WholayFonts.decoratedFontName, fontSize: 16.0, fontWeight: FontWeight.w600, color: WholayColors.textPrimary), // use
            ),
          ),
          child: child,
        );
      }
    );
    if (picked != null && picked != widget.dateValue) {
      setState(() { 
        _date = picked;
        if (widget.controller != null)
          widget.controller.text = formatDate(_date, [dd, '/', mm, '/', yyyy]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    _date = _date ?? (widget.dateValue ?? DateTime.now());

    // return DateTimePickerFormField(
    //   inputType: InputType.date,
    //   format: DateFormat('d MMMM yyyy'),
    //   editable: true,
    //   autofocus: true,
    //   initialDate: DateTime.now(),
    //   decoration: InputDecoration(
    //     labelText: '',
    //   ),
    //   onChanged: (sDate) => setState(() => _date = sDate),
    // );

    return InputWithLabel(
      controller: widget.controller,
      keyboardType: TextInputType.datetime,  //widget.keyboardType,
      labelCaption: widget.labelCaption,
      labelText: formatDate(_date, [dd, '/', mm, '/', yyyy]),
      inputFormatMask: 'XX/XX/XXXX',
      inputFormatSeparator: '/',
      hintText: widget.hintText,
      prefixIcon: widget.prefixIcon,
      subfixIcon: Icon(FontAwesomeIcons.calendarAlt, color: Colors.grey[600]),
      hasFloatingPlaceholder: widget.hasFloatingPlaceholder,
      readOnlyBackgroundColor: WholayColors.controlBackground,
      readonly: widget.readonly,
      required: widget.required,
      showUpperLabel: widget.showUpperLabel,
      requiredErrorText: widget.requiredErrorText,
      upperSpace: widget.upperSpace,
      lowerSpace: widget.lowerSpace,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onSuffixIconPressed: () {_selectDate(context);},      
    );
  }
}

class PasswordInput extends StatefulWidget {

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool hasFloatingPlaceholder;
  final bool required;
  final bool checkPattern;
  final bool showUpperLabel;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  PasswordInput({
    Key key, 
    this.controller,
    this.labelText, 
    this.hintText, 
    this.hasFloatingPlaceholder = false,
    this.required = false,
    this.checkPattern = false,
    this.showUpperLabel = false,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator
  }) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {

  bool _passwordVisibled = false;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget> [
        Visibility(
          visible: widget.showUpperLabel,
          child: Column(
            children: <Widget> [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.labelText,
                  style: controlLabelStyle(context),
                ),
              ),
              verticalSpace(WholaySpace.controlLabelVertical),
            ],
          ),
        ),
        TextFormField(           
          controller: widget.controller,     
          keyboardType: TextInputType.text,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          validator: (value) {
            var checker = Checker();
            checker.value = value;
            if (widget.required) {
              if (checker.isBlank)
                return 'กรุณาระบุรหัสผ่าน';
            }
            if (widget.checkPattern) {
              if (!checker.isValidPassword)
                return 'รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัวอักษร';
            }
            if (widget.validator != null)
              return widget.validator(value);
          },
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: _passwordVisibled ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _passwordVisibled = !_passwordVisibled; 
                });
              },
            ),
            hasFloatingPlaceholder: widget.hasFloatingPlaceholder,
          ),
          obscureText: !_passwordVisibled,
        ),
      ],
    );
  }
}

class EmailInput extends StatefulWidget {

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool hasFloatingPlaceholder;
  final bool required;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  EmailInput({
    Key key, 
    this.controller,
    this.labelText = 'E-Mail', 
    this.hintText = 'E-Mail ลงทะเบียนของคุณ', 
    this.hasFloatingPlaceholder = false,
    this.required = true,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      validator: (value) {
        Checker checker = Checker();
        checker.value = value;
        if (widget.required && checker.isBlank)
          return 'กรุณาใส่ข้อมูล E-Mail';
        else if (!checker.isValidEmail)
          return 'รูปแบบ E-Mail ไม่ถูกต้อง';
        else if (widget.validator != null)
          return widget.validator(value);
      },
      decoration: InputDecoration(                  
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: Icon(Icons.email),        
        hasFloatingPlaceholder: widget.hasFloatingPlaceholder,
      ),      
    );
  }
}

// Widget emailInput() {
//   return TextFormField(
//     decoration: InputDecoration(                  
//       labelText: 'E-Mail',
//       hintText: 'E-Mail ลงทะเบียนของคุณ',
//       prefixIcon: Icon(Icons.email),        
//       hasFloatingPlaceholder: false,
//     ),
//   );
// }

// Widget passwordConfirmInput() {
//   return Column(
//     children: <Widget>[
//       // passwordInput(),
//       PasswordInput(
//         labelText: 'รหัสผ่าน',
//         hintText: 'รหัสผ่านส่วนตัวของคุณ',
//       ),
//       verticalSpace(null),
//       PasswordInput(
//         labelText: 'ยืนยันรหัสผ่าน',
//         hintText: 'ยืนยันรหัสผ่านส่วนตัวของคุณ',
//       ),
//     ],
//   );
// }

// Widget phoneNumberInput() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: <Widget>[
//       Expanded(
//         flex: 1,
//         child: TextField(            
//           decoration: InputDecoration(
//             labelText: 'TH (+66)',
//             //suffixIcon: Icon(Icons.arrow_drop_down),
//             enabled: false,
//             hasFloatingPlaceholder: false,
//           ),
//         ),
//       ),  
//       horizontalSpace(WholaySpace.controlHorizontal),
//       Expanded(
//         flex: 2,
//         child: TextFormField(
//           decoration: InputDecoration(
//             labelText: 'เบอร์โทรศัพท์มือถือ',
//             hintText: 'เบอร์โทรศัพท์มือถือ',
//             prefixIcon: Icon(Icons.phone_android),
//             hasFloatingPlaceholder: false
//           ),
//         ),
//       ),
//     ],
//   );
// }

class PhoneNumberInput extends StatefulWidget {

  final bool required;
  final bool showCountryInput;
  final bool inlineCountryInput;
  final TextEditingController controller;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;

  PhoneNumberInput({
    Key key,
    this.required = false,
    this.showCountryInput = false,
    this.inlineCountryInput = true,
    this.controller,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
  }) : super(key: key);

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    return (widget.inlineCountryInput) 
      ?
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: widget.showCountryInput,
              child: Expanded(
                flex: 1,
                child: TextField(            
                  decoration: InputDecoration(
                    labelText: 'TH (+66)',
                    //suffixIcon: Icon(Icons.arrow_drop_down),
                    enabled: false,
                    fillColor: WholayColors.controlFixBackground,
                    hasFloatingPlaceholder: false,
                  ),
                ),
              ),
            ),  
            Visibility(
              visible: widget.showCountryInput,
              child: horizontalSpace(WholaySpace.controlHorizontal),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: widget.controller,
                keyboardType: TextInputType.phone,
                onEditingComplete: widget.onEditingComplete,
                onFieldSubmitted: widget.onFieldSubmitted,
                onSaved: widget.onSaved,
                validator: (value) {
                  if (widget.required && (value.trim().isEmpty || value == null)) 
                    return 'กรุณาระบุหมายเลขโทรศัพท์';
                },
                decoration: InputDecoration(
                  labelText: 'เบอร์โทรศัพท์มือถือ',
                  hintText: 'เบอร์โทรศัพท์มือถือ',
                  prefixIcon: Icon(Icons.phone_android),
                  hasFloatingPlaceholder: false
                ),
              ),
            ),
          ],
        )
      :
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: widget.showCountryInput,
              child: TextField(            
                decoration: InputDecoration(
                  labelText: 'Thailand (+66)',
                  //suffixIcon: Icon(Icons.arrow_drop_down),
                  enabled: false,
                  fillColor: WholayColors.controlFixBackground,
                  hasFloatingPlaceholder: false,
                ),
              ),
            ),  
            Visibility(
              visible: widget.showCountryInput,
              child: verticalSpace(WholaySpace.controlVertical),
            ),
            TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              onSaved: widget.onSaved,
              validator: (value) {
                if (widget.required && (value.trim().isEmpty || value == null)) 
                  return 'กรุณาระบุหมายเลขโทรศัพท์';
              },
              decoration: InputDecoration(
                labelText: 'เบอร์โทรศัพท์มือถือ',
                hintText: 'เบอร์โทรศัพท์มือถือ',
                prefixIcon: Icon(Icons.phone_android),
                hasFloatingPlaceholder: false
              ),
            ),
          ],
        );
  }
}

class OTPInput extends StatefulWidget {

  final int otpDigit;
  final int referNo;
  final bool showReferNo;
  final bool checkDigit;
  final TextEditingController controller;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  OTPInput({
    Key key,
    this.otpDigit = 6,
    this.referNo = 1,
    this.showReferNo = true,
    this.checkDigit = true,
    this.controller,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator
  }) : super(key: key);

  @override
  _OTPInputState createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  @override
  Widget build(BuildContext context) {

    double _scrWdt = MediaQuery.of(context).size.width;
    TextStyle _txtSty = (_scrWdt < WholaySpace.minScreenWidth) ? TextStyle(
      color: minorDataLabelStyle(context).color,
      fontFamily: minorDataLabelStyle(context).fontFamily,
      fontSize: minorDataLabelStyle(context).fontSize - 2
    ) : minorDataLabelStyle(context);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('รหัส OTP', style: controlLabelStyle(context)),
            Visibility(
              visible: (widget.showReferNo),
              child: Row(
                children: <Widget>[
                  Text('หมายเลขอ้างอิง : ', style: _txtSty),
                  Text(widget.referNo.toString(), style: _txtSty)
                ],
              ),
            ),
          ],
        ),
        verticalSpace(WholaySpace.controlLabelVertical),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          validator: (value) {
            if (value.trim().isEmpty || value == null)
              return 'กรุณาระบุรหัส OTP ที่ได้รับ';
            else if (widget.checkDigit) {
              if (value.length != widget.otpDigit)
                return 'รหัส OTP มีได้ ${widget.otpDigit} ตำแหน่ง กรุณาตรวจสอบ';
              else if (widget.validator != null)
                return widget.validator(value);
            } else 
              if (widget.validator != null)
                return widget.validator(value);
          },
          decoration: InputDecoration(
            labelText: 'รหัส OTP ที่ได้รับ',
            hintText: 'กรอกรหัส OTP ที่ได้รับ',
            prefixIcon: Icon(Icons.lock_outline),
            hasFloatingPlaceholder: false
          ),                      
        )
      ],
    );
  }
}

// class PhoneNumberInput_old extends StatelessWidget {

//   final bool required;
//   final TextEditingController controller;
//   final VoidCallback onEditingComplete;
//   final ValueChanged<String> onFieldSubmitted;
//   final FormFieldSetter<String> onSaved;

//   PhoneNumberInput({
//     Key key,
//     this.required = false,
//     this.controller,
//     this.onEditingComplete,
//     this.onFieldSubmitted,
//     this.onSaved
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Expanded(
//           flex: 1,
//           child: TextField(            
//             decoration: InputDecoration(
//               labelText: 'TH (+66)',
//               //suffixIcon: Icon(Icons.arrow_drop_down),
//               enabled: false,
//               hasFloatingPlaceholder: false,
//             ),
//           ),
//         ),  
//         horizontalSpace(WholaySpace.controlHorizontal),
//         Expanded(
//           flex: 2,
//           child: TextFormField(
//             controller: controller,
//             onEditingComplete: onEditingComplete,
//             onFieldSubmitted: onFieldSubmitted,
//             onSaved: onSaved,
//             validator: (value) {
//               required && (value.trim().isEmpty || value == null) ? 'กรุณาระบุหมายเลขโทรศัพท์' : null;
//             },
//             decoration: InputDecoration(
//               labelText: 'เบอร์โทรศัพท์มือถือ',
//               hintText: 'เบอร์โทรศัพท์มือถือ',
//               prefixIcon: Icon(Icons.phone_android),
//               hasFloatingPlaceholder: false
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class UserDisplayNameInput extends StatefulWidget {

  UserDisplayNameInput({
    Key key, 
    this.requiredDisplayName = true, 
    this.requiredMotto = false,
    this.showUpperLabel = false,
    this.displayNamecontroller, 
    this.mottocontroller,
    this.onDisplayNameEditingComplete,
    this.onDisplayNameFieldSubmitted,
    this.onDisplayNameSaved,
    this.onMottoEditingComplete,
    this.onMottoFieldSubmitted,
    this.onMottoSaved
  }) : super(key: key);
  
  final bool requiredDisplayName;
  final bool requiredMotto;
  final bool showUpperLabel;
  final TextEditingController displayNamecontroller;
  final TextEditingController mottocontroller;
  final VoidCallback onDisplayNameEditingComplete;
  final ValueChanged<String> onDisplayNameFieldSubmitted;
  final FormFieldSetter<String> onDisplayNameSaved;
  final VoidCallback onMottoEditingComplete;
  final ValueChanged<String> onMottoFieldSubmitted;
  final FormFieldSetter<String> onMottoSaved;

  @override
  _UserDisplayNameInputState createState() => _UserDisplayNameInputState();
}

class _UserDisplayNameInputState extends State<UserDisplayNameInput> {

  static const List<String> _reserveWords = <String>[
    'ชื่อแสดง',
    'คำประจำตัว',
    'DISPLAY NAME',
    'MOTTO',
    'SLOGAN'
  ];

  bool _isReserveWord(String value) {
    bool _yes = false;
    for (String word in _reserveWords) {
      _yes = (value.toUpperCase().trim() == word);
      if (_yes)
        break;
    }
    return _yes;
  }

  @override
  Widget build(BuildContext context) {

    double _verticalGap = (widget.showUpperLabel ? WholaySpace.controlVerticalLoose : WholaySpace.controlVertical);

    return Column(
      children: <Widget>[
        Visibility(
          visible: widget.showUpperLabel,
          child: Column(
            children: <Widget> [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'ชื่อแสดง',
                  style: controlLabelStyle(context),
                ),
              ),
              verticalSpace(WholaySpace.controlLabelVertical),
            ],
          ),
        ),
        TextFormField(
            // onChanged: onNameChanged,
          controller: widget.displayNamecontroller,
          validator: (value) {
            if (widget.requiredDisplayName && (value.trim().isEmpty || value == null)) 
              return 'กรุณากำหนดชื่อของคุณเพื่อแสดงให้ผู้อื่นเห็น';
            else if (!(value.trim().isEmpty || value == null)) {
              if (_isReserveWord(value))
                return 'ไม่สามารถใช้ชื่อที่กำหนดได้';
            }
          },
          onEditingComplete: widget.onDisplayNameEditingComplete,
          onFieldSubmitted: widget.onDisplayNameFieldSubmitted,
          onSaved: widget.onDisplayNameSaved,
          decoration: InputDecoration(
            labelText: 'ชื่อแสดง',
            hintText: 'ชื่อที่ต้องการแสดงให้ผู้อื่นเห็น',
            prefixIcon: Icon(Icons.person),
            hasFloatingPlaceholder: false
          ),
        ),
        verticalSpace(_verticalGap),
        Visibility(
          visible: widget.showUpperLabel,
          child: Column(
            children: <Widget> [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'คำประจำตัว',
                  style: controlLabelStyle(context),
                ),
              ),
              verticalSpace(WholaySpace.controlLabelVertical),
            ],
          ),
        ),
        TextFormField(
            // onChanged: onMottoChanged,
            controller: widget.mottocontroller,
            onEditingComplete: widget.onMottoEditingComplete,
            onFieldSubmitted: widget.onMottoFieldSubmitted,
            onSaved: widget.onMottoSaved,
            validator: (value) {
              if (widget.requiredMotto && (value.trim().isEmpty || value == null)) 
                return 'กรุณากำหนดคำประจำตัว';
              else if (!(value.trim().isEmpty || value == null)) {
                if (_isReserveWord(value))
                  return 'ไม่สามารถใช้คำประจำตัวที่กำหนดได้';
              }              
            },
            decoration: InputDecoration(
              labelText: 'คำประจำตัว',
              hintText: 'คำพูดโดนๆ ที่อยากให้โลกรู้',
              prefixIcon: Icon(Icons.format_quote),
              hasFloatingPlaceholder: false
            ),
          ),
      ],
    );
  }
}

class SwitchLabelInput extends StatefulWidget {

  SwitchLabelInput({
    Key key,
    this.labelText,
    this.value = false,
    this.onChanged,
    this.boldLabel =  false,
  }) : super(key: key);

  final String labelText;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool boldLabel;

  @override
  _SwitchLabelInputState createState() => _SwitchLabelInputState();
}

class _SwitchLabelInputState extends State<SwitchLabelInput> {

  bool _value;

  @override
  Widget build(BuildContext context) {

    String _label = (widget.labelText) ?? 'Switch Label'; 
    _value = _value ?? widget.value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            _label,
            style: (widget.boldLabel) ? controlBoldLabelStyle(context) : controlLabelStyle(context),
          ),
        ),
        Switch(
          // onChanged: widget.onChanged,
          // value: widget.value,
          onChanged: (value) {
            setState(() {
              _value = value;
              widget.onChanged(value);
            });
          },
          value: _value,
        ),
      ],
    );
  }
}

class DoubleSwitchLabelInput extends StatefulWidget {

  DoubleSwitchLabelInput({
    Key key,
    this.labelText,
    this.boldLabel      = false,
    this.fstValue       = false,
    this.sndValue       = false,
    this.fstActiveColor,
    this.sndActiveColor,
    this.fstInactiveColor,
    this.sndInactiveColor,
    this.leftIndent     = 0.0,
    this.rightIndent    = 0.0,
    this.topIndent      = 0.0,
    this.bottomIndent   = 0.0,
    this.onFstValueChanged,
    this.onSndValueChanged,
  }) : super(key: key);

  final String labelText;
  final bool boldLabel;
  final bool fstValue;
  final bool sndValue;
  final Color fstActiveColor;
  final Color sndActiveColor;
  final Color fstInactiveColor;
  final Color sndInactiveColor;
  final double leftIndent;
  final double rightIndent;
  final double topIndent;
  final double bottomIndent;
  final ValueChanged<bool> onFstValueChanged;
  final ValueChanged<bool> onSndValueChanged;

  @override
  _DoubleSwitchLabelInputState createState() => _DoubleSwitchLabelInputState();
}

class _DoubleSwitchLabelInputState extends State<DoubleSwitchLabelInput> {

  bool _fstValue;
  bool _sndValue;
  double _left    = 0.0;
  double _right   = 0.0;
  double _top     = 0.0;
  double _bottom  = 0.0;  

  @override
  Widget build(BuildContext context) {

    String _label = (widget.labelText) ?? 'Switch Label'; 
    _fstValue = _fstValue ?? widget.fstValue;
    _sndValue = _sndValue ?? widget.sndValue;

    _left   = widget.leftIndent ?? 0.0;
    _right  = widget.rightIndent ?? 0.0;
    _top    = widget.topIndent ?? 0.0;
    _bottom = widget.bottomIndent ?? 0.0;    

    return Padding(
      padding: EdgeInsets.fromLTRB(_left, _top, _right, _bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              _label,
              style: (widget.boldLabel) ? dataInfoBoldLabelStyle(context) : dataInfoLabelStyle(context),
            ),
          ),
          Switch(
            activeColor: widget.fstActiveColor,
            inactiveTrackColor: widget.fstInactiveColor,
            onChanged: (value) {
              setState(() {
                _fstValue = value;
                widget.onFstValueChanged(value);
              });
            },
            value: _fstValue,
          ),
          Switch(
            activeColor: widget.sndActiveColor,
            inactiveTrackColor: widget.sndInactiveColor,
            onChanged: (value) {
              setState(() {
                _sndValue = value;
                widget.onSndValueChanged(value);
              });
            },
            value: _sndValue,
          ),
        ],
      ),
    );
  }
}

// class UserDisplayNameInput_Old extends StatelessWidget {

//   // final ValueChanged<String> onNameChanged;
//   // final ValueChanged<String> onMottoChanged;
//   final bool requiredDisplayName;
//   final bool requiredMotto;
//   final TextEditingController displayNamecontroller;
//   final TextEditingController mottocontroller;
//   final VoidCallback onDisplayNameEditingComplete;
//   final ValueChanged<String> onDisplayNameFieldSubmitted;
//   final FormFieldSetter<String> onDisplayNameSaved;
//   final VoidCallback onMottoEditingComplete;
//   final ValueChanged<String> onMottoFieldSubmitted;
//   final FormFieldSetter<String> onMottoSaved;

//   UserDisplayNameInput({
//     Key key, 
//     this.requiredDisplayName = true, 
//     this.requiredMotto = false,
//     this.displayNamecontroller, 
//     this.mottocontroller,
//     this.onDisplayNameEditingComplete,
//     this.onDisplayNameFieldSubmitted,
//     this.onDisplayNameSaved,
//     this.onMottoEditingComplete,
//     this.onMottoFieldSubmitted,
//     this.onMottoSaved
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         TextFormField(
//             // onChanged: onNameChanged,
//             controller: displayNamecontroller,
//             validator: (value) {
//               requiredDisplayName && (value.trim().isEmpty || value == null) ? 'กรุณากำหนดชื่อของคุณเพื่อแสดงให้ผู้อื่นเห็น' : null;
//             },
//             onEditingComplete: onDisplayNameEditingComplete,
//             onFieldSubmitted: onDisplayNameFieldSubmitted,
//             onSaved: onDisplayNameSaved,
//             decoration: InputDecoration(
//               labelText: 'ชื่อแสดง',
//               hintText: 'ชื่อที่ต้องการแสดงให้ผู้อื่นเห็น',
//               prefixIcon: Icon(Icons.person),
//               hasFloatingPlaceholder: false
//             ),
//           ),
//         verticalSpace(null),
//         TextFormField(
//             // onChanged: onMottoChanged,
//             controller: mottocontroller,
//             onEditingComplete: onMottoEditingComplete,
//             onFieldSubmitted: onMottoFieldSubmitted,
//             onSaved: onMottoSaved,
//             validator: (value) {
//               requiredMotto && (value.trim().isEmpty || value == null) ? 'กรุณากำหนดคำประจำตัว' : null;
//             },
//             decoration: InputDecoration(
//               labelText: 'คำประจำตัว',
//               hintText: 'คำพูดโดนๆ ที่อยากให้โลกรู้',
//               prefixIcon: Icon(Icons.format_quote),
//               hasFloatingPlaceholder: false
//             ),
//           ),
//       ],
//     );
//   }
// }

// Widget userDisplayTextinput() {
//   return Column(
//     children: <Widget>[
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
//         child: TextFormField(
//           decoration: InputDecoration(
//             labelText: 'ชื่อแสดง',
//             hintText: 'ชื่อที่ต้องการแสดงให้ผู้อื่นเห็น',
//             prefixIcon: Icon(Icons.person),
//             hasFloatingPlaceholder: false
//           ),
//         ),
//       ),
//       verticalSpace(null),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
//         child: TextFormField(
//           decoration: InputDecoration(
//             labelText: 'คำประจำตัว',
//             hintText: 'คำพูดโดนๆ ที่อยากให้โลกรู้',
//             prefixIcon: Icon(Icons.format_quote),
//             hasFloatingPlaceholder: false
//           ),
//         ),
//       ),
//     ],
//   );
// } 

class FullWidthButton extends StatelessWidget {

  final String caption;
  final Widget icon;
  final bool enabled;
  final VoidCallback onPressed;

  FullWidthButton({Key key, this.caption, this.icon, this.enabled = true, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,       
      child: Container(
        height: WholaySpace.buttonHeight,
        child: (icon == null) 
        ? RaisedButton(
          child: Text(caption),
          onPressed: enabled ? onPressed : null,
        )
        : RaisedButton.icon (
          icon: icon,                                            
          label: Text(caption),
          onPressed: enabled ? onPressed : null,
        ),
      ),      
    );
  }
}

class SaveFullWidthButton extends StatelessWidget {

  final double  horizontalGap;
  final double  upperSpace;
  final double  lowerSpace;
  final bool    enabled;
  final VoidCallback onPressed;

  SaveFullWidthButton({
    Key key, 
    this.horizontalGap = 0.0,
    this.upperSpace,
    this.lowerSpace,
    this.enabled = true,
    @required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _upperSpace = (upperSpace == null ? WholaySpace.controlButtonVertical : upperSpace);
    double _lowerSpace = (lowerSpace == null ? WholaySpace.controlButtonVertical : lowerSpace);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalGap),
      child: Column(
        children: <Widget>[
          verticalSpace(_upperSpace), 
          FullWidthButton(
            caption: 'บันทึก', 
            icon: Icon(Icons.check),
            enabled: enabled,
            onPressed: onPressed,
          ),
          verticalSpace(_lowerSpace),
        ],
      ),
    );
  }
}

class BorderHighlightButton extends StatelessWidget {

  final String caption;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final double elevation;
  final double highlightElevation;
  final VoidCallback onPressed;

  BorderHighlightButton({
    Key key,
    this.caption,
    this.buttonColor = Colors.white,
    this.borderColor,
    this.textColor,
    this.elevation = 0.0,
    this.highlightElevation = 0.0,
    this.onPressed
  }) : super (key: key);

  Color _borderColor = WholayColors.primary;
  Color _textColor = WholayColors.textPrimary;

  @override
  Widget build(BuildContext context) {

    if (borderColor != null)
      _borderColor = borderColor;
    if (textColor != null)
      _textColor = textColor;

    return RawMaterialButton(
      fillColor: buttonColor,
      elevation: elevation,
      highlightElevation: highlightElevation,
      child: Text(
        caption, 
        style: TextStyle(
          fontFamily: Theme.of(context).textTheme.button.fontFamily,
          letterSpacing: Theme.of(context).textTheme.button.letterSpacing,
          fontSize: Theme.of(context).textTheme.button.fontSize,
          fontWeight: Theme.of(context).textTheme.button.fontWeight,
          fontStyle: Theme.of(context).textTheme.button.fontStyle,
          color: _textColor
        ),
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
        side: BorderSide(
          color: _borderColor,
          width: WholaySpace.borderSize,
        )
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {

  final Widget  caption;
  final Widget  icon;
  final double  buttonWidth;
  final double  buttonHeight;
  final double  cornerRadius;
  final Color   buttonColor;

  ContainerButton({
    Key   key,
    @required this.caption,
    this.icon,
    this.buttonWidth,
    this.buttonHeight,
    this.cornerRadius = 8.0,
    this.buttonColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? 150.0,
      height: buttonHeight ?? 40.0,
      decoration: BoxDecoration(
        color: buttonColor ?? WholayColors.primary,
        borderRadius: BorderRadius.circular(cornerRadius ?? 8.0),
      ),
      child: Row(
        mainAxisAlignment: (icon != null) ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: (icon != null) ? true : false,
            child: icon ?? SizedBox(width: 0.0, height: 0.0),
          ),                            
          caption,
        ],
      ),
    );
  }
}

class ListTileFix extends StatelessWidget {

  final String  title;
  final Color   color;
  final Widget  leadingIcon;
  final bool    defaultColorPainted;
  final bool    showUpperDivide;
  final bool    showLowerDivide;
  final bool    showArrowIcon;
  final GestureTapCallback onTap;

  ListTileFix({
    Key key, 
    @required this.title,
    this.color,
    this.leadingIcon,
    this.defaultColorPainted = true,
    this.showUpperDivide = false,
    this.showLowerDivide = false,
    this.showArrowIcon = true,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color _color;
    if (defaultColorPainted)
      _color = WholayColors.backgroundSecondary;
    else if (color != null)
      _color = color;

    return Column(
      children: <Widget>[
        Visibility(
          visible: showUpperDivide,
          child: lineDivideFader(),
        ),
        Ink(
          color: _color,
          child: ListTile(
            leading: leadingIcon,
            title: Text(title, style: listTileTitleTextStyle()),
            trailing: (showArrowIcon) ? arrowRightIcon() : null,
            onTap: onTap,
          ),
        ),
        Visibility(
          visible: showLowerDivide,
          child: lineDivideFader(),
        ),
      ],
    );
  }
}

class ListTileWithData extends StatelessWidget {

  final String  title;
  final String  data;
  final Color   color;
  final Widget  leadingIcon;
  final bool    defaultColorPainted;
  final bool    dataUnderTitle;
  final bool    showUpperDivide;
  final bool    showLowerDivide;
  final bool    autoDataPosition;
  final TextStyle headerTextStyle;
  final TextStyle dataTextStyle;
  final GestureTapCallback onTap;

  ListTileWithData({
    Key key,
    @required this.title,
    this.data,
    this.color,
    this.leadingIcon,
    this.defaultColorPainted = true,
    this.dataUnderTitle = false,  // if true, autoDataPosition is not effected.
    this.showUpperDivide = false,
    this.showLowerDivide = false,
    this.autoDataPosition = true,
    this.headerTextStyle,
    this.dataTextStyle,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    TextStyle _headTextStyle = (headerTextStyle == null) ? ((dataUnderTitle) ? listTileHeaderTextStyle() : listTileTitleTextStyle()) : headerTextStyle;
    TextStyle _dataTextStyle = (dataTextStyle == null) ? listTileDataTextStyle() : dataTextStyle;

    double _screenWidth = MediaQuery.of(context).size.width;

    bool _dataUnderTitle = dataUnderTitle ? dataUnderTitle : (autoDataPosition ? (_screenWidth < WholaySpace.minScreenWidth ? true : false) : dataUnderTitle);

    Color _color;
    if (defaultColorPainted)
      _color = Colors.white;
    else if (color != null)
      _color = color;

    return Column(
      children: <Widget>[
        Visibility(
          visible: showUpperDivide,
          child: lineDivideFader(),
        ),
        Ink(
          color: _color,
          child: ListTile(
            leading: leadingIcon,        
            title: Text(title, style: _headTextStyle),
            subtitle: (_dataUnderTitle) ? ((data != null) ? Text(data, style: _dataTextStyle) : null) : null,
            trailing: (!_dataUnderTitle) ? ((data != null) ? Text(data, style: _dataTextStyle) : null) : null,
            // title: Text(title, style: (dataUnderTitle) ? listTileHeaderTextStyle() : listTileTitleTextStyle()),
            // subtitle: (dataUnderTitle) ? ((data != null) ? Text(data, style: listTileDataTextStyle()) : null) : null,
            // trailing: (!dataUnderTitle) ? ((data != null) ? Text(data, style: listTileDataTextStyle()) : null) : null,
            onTap: onTap,
          ),
        ),
        Visibility(
          visible: showLowerDivide,
          child: lineDivideFader(),
        ),
      ],
    );
  }
}

// --------- For email and SMS verify --------------------------------------
class VerifyTabButton extends StatelessWidget {

  final double  height;
  final String  caption;
  final Color   color;
  final bool    enabled;
  final VoidCallback onPressed;

  VerifyTabButton({
    Key key,
    this.height = 64.0,
    this.caption = '',
    this.color,
    this.enabled = true,
    this.onPressed,    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color _iconcolor = (enabled) ? WholayColors.textPrimary : WholayColors.textDisabled;

    return Container(
      height: height,
      color: enabled ? color : WholayColors.backgroundSecondary,
      padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
      child: GestureDetector(
        onTap: (enabled) ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                caption,
                style: (enabled) ? minorLabelStyle(context) : minorLabelDisableStyle(context),
              ),
            ),
            horizontalSpace(16.0),
            Icon(Icons.autorenew, size: WholaySpace.headIconSize, color: _iconcolor),
            // IconButton(
            //   icon: Icon(Icons.autorenew, size: WholaySpace.headIconSize, color: _iconcolor),
            //   onPressed: (enabled) ? onPressed : null,
            // ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------------------------------------------------------------------

class SecondaryTitleBar extends StatelessWidget {

  final String titleText;

  SecondaryTitleBar({
    Key key,
    this.titleText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: WholaySpace.titleBarHeight,
      color: WholayColors.backgroundPrimary,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        titleText,
        style: secondaryAppBarLikeTitleStyle(context),
      ),      
    );
  }
}


// class InfoDisplayCard extends StatelessWidget {

//   InfoDisplayCard({
//     Key key,
//     this.visible = true,
//     @required this.headerText,
//     @required this.dataText,
//     this.inlineDataInfo = false,
//     this.showUpperDivide = false,
//     this.showLowerDivide = false,
//     this.leftIndent = 0,
//     this.rightIndent = 0,
//     this.topIndent = 0,
//     this.bottomIndent = 0,
//     this.backgroundColor
//   }) : super(key: key);

//   final bool  visible;
//   final List<String> headerText;
//   final List<String> dataText;
//   final bool  inlineDataInfo;
//   final bool  showUpperDivide;
//   final bool  showLowerDivide;
//   final double leftIndent;
//   final double rightIndent;
//   final double topIndent;
//   final double bottomIndent;
//   final Color backgroundColor;

//   @override
//   Widget build(BuildContext context) {

//     int _colCnt = headerText.length;

//     return Container(
//       color: backgroundColor,
//       padding: EdgeInsets.fromLTRB(leftIndent, topIndent, rightIndent, bottomIndent),
//     );
//   }
// }

enum IconSizeLevel {Small, Medium, Large}

class FiveStarsScore extends StatelessWidget {

  final Color     activeColor;
  final Color     inactiveColor;
  final double    stars;
  final int       voter;
  final IconSizeLevel iconSizeLevel;
  final bool      showOnlyActiveStar;
  final bool      showVoterNumber;

  FiveStarsScore({
    Key key,
    this.activeColor,
    this.inactiveColor,
    this.stars  = 0.0,
    this.voter  = 0,
    this.iconSizeLevel = IconSizeLevel.Medium,
    this.showOnlyActiveStar = false,
    this.showVoterNumber = true
  }) : super (key: key);

  IconData  _fullStarIcon = Icons.star;       //  FontAwesomeIcons.star;
  IconData  _halfStarIcon = Icons.star_half;   //  FontAwesomeIcons.starHalf;

  Widget _starIcon(int level, double star) {
    double    _size = 24.0;
    Color     _activeColor = (activeColor) ?? Colors.yellow[700]; 
    Color     _inactiveColor = (inactiveColor) ?? Colors.grey[300]; 
    int       _starLevel = star.truncate();
    double    _mod = star % _starLevel;
    Color     _color = ((level <= _starLevel) || (_starLevel > 0 && _starLevel < 1)) ? _activeColor : _inactiveColor;
    IconData  _icon = ((_mod > 0 && _mod <= 0.5) && (level == _starLevel + 1)) ? _halfStarIcon : _fullStarIcon;

    if ((level == 1) && (star >= 0.5 && star < 1)) {
      _color = _activeColor;
      _icon = _halfStarIcon;
    } else if ((_mod > 0 && _mod <= 0.5) && (level == _starLevel + 1))
      _color = _activeColor;

    switch (iconSizeLevel) {
      case IconSizeLevel.Large:
        _size = 32.0;
        break;
      case IconSizeLevel.Medium:
        _size = 24.0;
        break;
      case IconSizeLevel.Small:
        _size = 16.0;
        break;
      default: _size = 24.0;
    }

    return Icon(_icon, color: _color, size: _size);
  }

  @override
  Widget build(BuildContext context) {

    bool _isActiveLevel(int level) {
      return ((level <= stars.truncate()) && (stars > 0));
    } 

    bool _showIcon(int level) {
      bool _result = true;
      if (showOnlyActiveStar)
        if (!_isActiveLevel(level))
          _result = false;
      return _result;
    }

    double _getFontSize() {
      switch (iconSizeLevel) {
        case IconSizeLevel.Large:
          return 16.0;
          break;
        case IconSizeLevel.Medium:
          return 14.0;
          break;
        case IconSizeLevel.Small:
          return 12.0;
          break;
        default: return 12.0;
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Visibility(visible: _showIcon(1), child: _starIcon(1, stars)),
        Visibility(visible: _showIcon(2), child: _starIcon(2, stars)),
        Visibility(visible: _showIcon(3), child: _starIcon(3, stars)),
        Visibility(visible: _showIcon(4), child: _starIcon(4, stars)),
        Visibility(visible: _showIcon(5), child: _starIcon(5, stars)),
        Visibility(
          visible: showVoterNumber && (voter > 0) && (voter != null), 
          child: Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              '(${voter.toString()})',
              style: TextStyle(
                color: Colors.yellow[700],
                fontFamily: WholayFonts.decoratedFontName,
                fontSize: _getFontSize(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyServiceTile extends StatefulWidget {

  final String  serviceName;
  final double  starScore;
  final int     voter;
  final bool    opened;
  final bool    showLowerDivide;
  final GestureTapCallback onTap;

  MyServiceTile({
    Key key,
    this.serviceName,
    this.starScore = 0.0,
    this.voter = 0,
    this.opened = true,
    this.showLowerDivide = true,
    this.onTap
  }) : super(key: key);

  @override
  _MyServiceTileState createState() => _MyServiceTileState();
}

class _MyServiceTileState extends State<MyServiceTile> {

  bool _opened;

  @override
  Widget build(BuildContext context) {

    _opened = ((_opened == null) && (widget.opened != null)) ? widget.opened : _opened ?? true;

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: widget.onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.serviceName ?? '', 
                      style: TextStyle(
                        color: majorLabelStyle(context).color,
                        fontFamily: majorLabelStyle(context).fontFamily,
                        fontWeight: majorLabelStyle(context).fontWeight,
                        fontSize: majorLabelStyle(context).fontSize + 3,
                      ),
                    ),
                    FiveStarsScore(
                      stars: widget.starScore,
                      voter: widget.voter,
                      iconSizeLevel: IconSizeLevel.Medium,
                    ),
                  ],
                ),
              ),              
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Switch(
                    value: _opened,
                    onChanged: (value) {
                      setState(() {
                       _opened = value; 
                      });
                    },
                  ),
                  Text(
                    _opened ? 'เปิดบริการ' : 'ปิดบริการ',
                    style: _opened ? minorLabelStyle(context) : minorLabelDisableStyle(context),
                  ),
                ],
              )
            ],
          ),
        ),
        Visibility(
          visible: widget.showLowerDivide,
          child: lineDivideFader(),
        )
      ],
    );
  }
}