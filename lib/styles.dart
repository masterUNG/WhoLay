import 'package:flutter/material.dart';
import 'package:wholay/widgets/appWidgets.dart';

// Colors Style ----------------------------------------------
final Color wlColorPrimary = Colors.lightBlue[800];                   // Color(0xFF3D8BCC);
final Color wlColorMainBackground = Colors.teal[100];             // Color(0xFFACD9DC);
final Color wlColorSurface = Color(0xFFF2F8FF);
final Color wlColorMainBackgroundText = Colors.teal[300];             
final Color wlColorBackgroundText = Colors.cyan[300];             
final Color wlColorPrimaryBackground = Colors.blue[100];          // Color(0xFFD5EBF6);
final Color wlColorSecondaryBackground = Colors.blue[50];        // Color(0xFFF3F8FC);
final Color wlColorPrimaryText = Colors.lightBlue[900];                // Color(0xFF005FB1);
final Color wlColorSecondaryText = Colors.lightBlue[800];              // Color(0xFF3D8BCC);
final Color wlColorFadeText = Colors.lightBlue[600];              // Color(0xFF3D8BCC);
final Color wlColorFaderText = Colors.lightBlue[300];              // Color(0xFF3D8BCC);
final Color wlColorPlaceholderText = Colors.blue[300];            // Color(0xFF9DC5E5);
final Color wlColorPrimaryDataText = Colors.grey[800];                    // Color(0xFF666666);
final Color wlColorSecondaryDataText = Colors.grey[700];                   // Color(0xFF666666);
final Color wlColorGeneralDataText = Colors.grey[600];                   
final Color wlColorControlBorder = Colors.blue[300];              // Color(0xFFD2E5F6);
final Color wlColorControlBackground = Colors.white;
final Color wlColorControlFixBackground = Colors.grey[200];       // Color(0xFFF3F8FC);
final Color wlColorControlFixBorder = Colors.grey;       // Color(0xFFF3F8FC);
final Color wlColorWarningTab = Colors.yellow[800];                 // Color(0xFFE4BF06);
final Color wlColorDisableText = Colors.grey[400];
final Color wlColorVolunteerPrimary = Colors.green[600];
final Color wlColorRecipientPrimary = Colors.amber[800];
final Color wlColorControlLightBackground = Colors.grey[100];

class WholayColors {
  WholayColors._();

  static const Map<int, Color> blue = const <int, Color> {
    50:   const Color(0xFFE1F5FE),
    100:  const Color(0xFFB3E5FC),
    200:  const Color(0xFF81D4FA),
    300:  const Color(0xFF29B6F6),
    400:  const Color(0xFF039BE5),
    500:  const Color(0xFF0277BD),
    600:  const Color(0xFF01579B),
    700:  const Color(0xFF014E8A),
    800:  const Color(0xFF013E6D),
    900:  const Color(0xFF012D50)
  };

  static final Color primary = wlColorPrimary;
  static final Color backgroundMain = wlColorMainBackground;
  static final Color backgroundPrimary = wlColorPrimaryBackground;
  static final Color backgroundSecondary = wlColorSecondaryBackground;
  static final Color surface = wlColorSurface;
  static final Color textBackgroundMain = wlColorMainBackgroundText;
  static final Color textBackground = wlColorBackgroundText;
  static final Color textPrimary = wlColorPrimaryText;
  static final Color textSecondary = wlColorSecondaryText;
  static final Color textFade = wlColorFadeText;
  static final Color textFader = wlColorFaderText;
  static final Color textPlaceholder = wlColorPlaceholderText;
  static final Color textDataPrimary = wlColorPrimaryDataText;
  static final Color textDataSecondary = wlColorSecondaryDataText;
  static final Color textDataGeneral = wlColorGeneralDataText;
  static final Color textDisabled = wlColorDisableText;
  static final Color controlBorder = wlColorControlBorder;
  static final Color controlBackground = wlColorControlBackground;
  static final Color controlFixBackground = wlColorControlFixBackground;
  static final Color controlFixBorder = wlColorControlFixBorder;
  static final Color warningTab = wlColorWarningTab;
  static final Color volunteerPrimary = wlColorVolunteerPrimary;
  static final Color recipientPrimary = wlColorRecipientPrimary;
  static final Color controlLightBackground = wlColorControlLightBackground;
}

class WholayFonts {
  WholayFonts._();

  static final String decoratedFontName = 'Prompt';
}

TextStyle controlLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize,
);

TextStyle controlBoldLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize,
  fontWeight: FontWeight.w600
);

TextStyle controlMajorTitleStyle(BuildContext context) => TextStyle(
  color: WholayColors.textPrimary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.title.fontSize,
);

TextStyle majorLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textPrimary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.body1.fontSize,
  fontWeight: FontWeight.w600,
);

TextStyle minorLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.body1.fontSize,
);

TextStyle minorBoldLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.body1.fontSize,
  fontWeight: FontWeight.w600,
);

TextStyle minorLabelDisableStyle(BuildContext context) => TextStyle(
  color: WholayColors.textDisabled,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.body1.fontSize,
);

TextStyle minorDataLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textDataSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.body1.fontSize,
);

TextStyle primaryHeaderLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textPrimary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.title.fontSize,
  fontWeight: FontWeight.w600,
  // fontWeight: Theme.of(context).textTheme.title.fontWeight,
);

TextStyle secondaryHeaderLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.subhead.fontSize,
  fontWeight: FontWeight.w600,
);

TextStyle dataHeaderLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textDataPrimary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.title.fontSize,
);

TextStyle dataInfoLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textDataSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.body1.fontSize
);

TextStyle dataInfoBoldLabelStyle(BuildContext context) => TextStyle(
  color: WholayColors.textDataSecondary,
  fontFamily: Theme.of(context).textTheme.title.fontFamily,
  fontSize: Theme.of(context).textTheme.body1.fontSize,
  fontWeight: FontWeight.w600,
);

TextStyle secondaryAppBarTitleStyle() => TextStyle(
  color: WholayColors.textPrimary, 
  fontWeight: FontWeight.w600
);  // use with AppBar only.

TextStyle secondaryAppBarLikeTitleStyle(BuildContext context) => TextStyle(
  fontFamily: Theme.of(context).appBarTheme.textTheme.title.fontFamily,
  fontSize: Theme.of(context).appBarTheme.textTheme.title.fontSize,
  color: secondaryAppBarTitleStyle().color,
  fontWeight: secondaryAppBarTitleStyle().fontWeight
);

TextStyle listTileTitleTextStyle() => TextStyle(
  color: WholayColors.textPrimary, 
  fontFamily: WholayFonts.decoratedFontName,
  fontSize: 15.0,
  // fontWeight: FontWeight.w600
);

TextStyle listTileHeaderTextStyle() => TextStyle(
  color: WholayColors.textPrimary, 
  fontFamily: WholayFonts.decoratedFontName,
  fontSize: 14.0,
  // fontWeight: FontWeight.w600
);

TextStyle listTileDataTextStyle() => TextStyle(
  color: WholayColors.textDataPrimary, 
  fontSize: 15.0,
  // fontWeight: FontWeight.w600
);

ThemeData wholayTheme() {

  // double _screenWidth = MediaQuery.of(context).size.width;
  // double _buttonFontSize = (_screenWidth < WholaySpace.minScreenWidth) ? 14.0 : 16.0;
  // double _appbarTitleFontSize = (_screenWidth < WholaySpace.minScreenWidth) ? 16.0 : 18.0;

  // TextStyle _captionStyle = (_screenWidth < WholaySpace.minScreenWidth) 
  //                           ? TextStyle(fontFamily: WholayFonts.decoratedFontName, fontSize: 12.0)
  //                           : TextStyle(fontFamily: WholayFonts.decoratedFontName, fontSize: 14.0);

  final double _buttonFontSize = 16.0;
  final double _appbarTitleFontSize = 18.0;

  return ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.green,
    primarySwatch: MaterialColor(WholayColors.blue[500].value, WholayColors.blue),
    textTheme: TextTheme(
      title: TextStyle(fontFamily: WholayFonts.decoratedFontName, color: WholayColors.textPrimary),
      subtitle: TextStyle(fontFamily: WholayFonts.decoratedFontName, color: WholayColors.textSecondary),
      caption: TextStyle(fontFamily: WholayFonts.decoratedFontName),
      // body1: TextStyle(fontFamily: 'CSChatThai'),
      // body2: TextStyle(fontFamily: 'CSChatThai'),
      headline: TextStyle(fontFamily: WholayFonts.decoratedFontName),
      // subhead: TextStyle(fontFamily: WholayFonts.decoratedFontName),
      // overline: TextStyle(fontFamily: 'CSChatThai'),
      // display1: TextStyle(fontFamily: WholayFonts.decoratedFontName, fontSize: 26.0),
      // display2: TextStyle(fontFamily: 'CSChatThai'),
      display3: TextStyle(fontFamily: WholayFonts.decoratedFontName),
      display4: TextStyle(fontFamily: WholayFonts.decoratedFontName),
      button: TextStyle(fontFamily: WholayFonts.decoratedFontName, letterSpacing: 0.4, fontSize: _buttonFontSize, fontWeight: FontWeight.w600),
    ),
    appBarTheme: AppBarTheme( 
      textTheme: TextTheme(
        title: TextStyle(
          fontFamily: WholayFonts.decoratedFontName,
          fontSize: _appbarTitleFontSize,
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.0)),  
      buttonColor: WholayColors.primary,
      textTheme: ButtonTextTheme.primary,
      height: WholaySpace.buttonHeight,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: WholayColors.controlBackground,
      errorMaxLines: 3,
      contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: WholayColors.controlBorder,
          style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    ),
  );
}