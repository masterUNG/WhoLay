import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/views/login.dart';
import 'package:wholay/views/userProfile/userAccountEntry.dart';

class LoginDrawerMenuPage extends StatefulWidget {
  @override
  _LoginDrawerMenuPageState createState() => _LoginDrawerMenuPageState();
}

class _LoginDrawerMenuPageState extends State<LoginDrawerMenuPage> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _logoWdt = (_screenWidth < WholaySpace.minScreenWidth)
        ? ((90 * _screenWidth) / WholaySpace.minScreenWidth)
        : 90.0;
    double _logoHgt = _logoWdt;
    double _captionFontSize = (_screenWidth < WholaySpace.minScreenWidth)
        ? ((46 * _screenWidth) / WholaySpace.minScreenWidth)
        : 46.0;
    double _mottoFontSize = (_screenWidth < WholaySpace.minScreenWidth)
        ? ((18 * _screenWidth) / WholaySpace.minScreenWidth)
        : 18.0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.backgroundMain,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
          child: Column(
            children: <Widget>[
              // verticalSpace(35.0),
              Spacer(flex: 1),
              wholayBrandHeader(
                  logoWidth: _logoWdt, // 90.0,
                  logoHeight: _logoHgt, // 90.0,
                  captionFontsize: _captionFontSize, // 46.0,
                  mottoFontsize: _mottoFontSize // 18.0
                  ),
              Spacer(flex: 2),
              // verticalSpace(120.0),
              FullWidthButton(
                caption: 'ลงชื่อเข้าใช้',
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              // Spacer(flex: 1),
              verticalSpace(30.0),
              SocialButtonBar(
                buttonColor: Colors.white, // WholayColors.primary,
                iconColor: WholayColors.primary,
                onPressedFacebook: () {},
                onPressedGoogle: () {},
                onPressedLine: () {},
              ),
              Spacer(flex: 1),
              // verticalSpace(10.0),
              Expanded(child: Container()),
              Container(
                height: WholaySpace.buttonHeight,
                width: double.maxFinite,
                child: BorderHighlightButton(
                  caption: 'ลงทะเบียน',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserAcctEntryPage()),
                    );
                  },
                ),
              ),
              verticalSpace(50.0),
            ],
          ),
        ),
      ),
    );
  }
}
