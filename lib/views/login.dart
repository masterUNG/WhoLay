import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wholay/main.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/views/userProfile/userAccountEntry.dart';
import 'package:wholay/views/userProfile/forgotPWunknowEmail.dart';
import 'package:wholay/api/user_account_api.dart';
import 'package:wholay/constants/key.dart' as Local;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wholay/dialogs.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();

  bool _loading = false;
  String _errMsg; // Added by Art.

  String validateUser(String email, String password) {
    UserAccountAPI.reference.where('email', isEqualTo: email).snapshots();
  }

  void _login(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _loading = true;
      });

      _auth
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _pwController.text.trim())
          .then((user) async {
        accessInfo.signupReady = true;

        await _secureStorage.write(key: Local.Key.USER_UID, value: user.uid);
        await _secureStorage.write(key: Local.Key.USER_EMAIL, value: user.email);
        await _secureStorage.write(
            key: Local.Key.SIGNUPREADY,
            value: accessInfo.signupReady.toString()
        );

        userModel.userId = user.uid;
        userModel.email = user.email;
        userModel.getUserProfile();

        setState(() {
          _loading = false;
        });

        Navigator.popUntil(
          context,
          ModalRoute.withName('/'),
        );
      }).catchError((onError) {
        // print("[_login error] " + onError.toString());

        // Corrected by Art.
        _errMsg = onError.toString();
        if (_errMsg.contains('ERROR_USER_NOT_FOUND'))
          _errMsg = 'ไม่พบผู้ใช้ "' + _emailController.text.trim() + '" ในระบบ';
        else if (_errMsg.contains('ERROR_WRONG_PASSWORD'))
          _errMsg = 'รหัสผ่านไม่ถูกต้อง';
        errorDialog(context, 'Error', _errMsg);
        setState(() {
          _loading = false;
        });
        _formKey.currentState.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _logoWdt = (_screenWidth < WholaySpace.minScreenWidth)
        ? ((100 * _screenWidth) / WholaySpace.stdScreenWidth)
        : 100.0;
    double _logoHgt = _logoWdt;
    double _captionFontSize = (_screenWidth < WholaySpace.minScreenWidth)
        ? ((50 * _screenWidth) / WholaySpace.stdScreenWidth)
        : 50.0;
    double _mottoFontSize = (_screenWidth < WholaySpace.minScreenWidth)
        ? ((19 * _screenWidth) / WholaySpace.stdScreenWidth)
        : 19.0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.backgroundMain,
      body: ModalProgressHUD(
          child: SafeArea(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal),
              child: Column(
                children: <Widget>[
                  // verticalSpace(35.0),
                  Spacer(flex: 1),
                  wholayBrandHeader(
                      logoWidth: _logoWdt,
                      logoHeight: _logoHgt,
                      captionFontsize: _captionFontSize,
                      mottoFontsize: _mottoFontSize),
                  Spacer(flex: 1),
                  // verticalSpace(30.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        EmailInput(
                            required: true,
                            controller: _emailController,
                            onSaved: (value) {}),
                        verticalSpace(WholaySpace.controlVertical),
                        PasswordInput(
                          required: false,
                          checkPattern: false,
                          labelText: 'รหัสผ่าน',
                          hintText: 'รหัสผ่านส่วนตัวของคุณ',
                          controller: _pwController,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(20.0),
                  SignButton(
                    onPressedRegister: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserAcctEntryPage()),
                      );
                    },
                    onPressedEnter: () {
                      _login(context);
                    },
                  ),
                  Spacer(flex: 2),
                  // verticalSpace(40.0),
                  socialText(context),
                  verticalSpace(15.0),
                  SocialButtonBar(
                    buttonColor: WholayColors.primary,
                    iconColor: Colors.white,
                    onPressedFacebook: () {},
                    onPressedGoogle: () {},
                    onPressedLine: () {},
                  ),
                  Spacer(
                      flex:
                          (_screenWidth < WholaySpace.minScreenWidth) ? 2 : 3),
                  verticalSpace(5.0),
                  Expanded(
                      child: ForgotPasswordIconLabel(
                    backgroundColor: WholayColors.backgroundMain,
                    highlightColor: WholayColors.backgroundMain,
                    splashColor: WholayColors.backgroundMain,
                    iconColor: Colors.grey[600],
                    labelColor: Colors.grey[600],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPWunknowEmailPage()),
                      );
                    },
                  )),
                  verticalSpace(10.0),
                ],
              ),
            ),
          ),
          inAsyncCall: _loading),
    );
  }
}

// Widget signInput() {
//   return Form(
//     child: Column(
//       children: <Widget>[
//         EmailInput(),
//         verticalSpace(WholaySpace.controlVertical),
//         PasswordInput(
//           labelText: 'รหัสผ่าน',
//           hintText: 'รหัสผ่านส่วนตัวของคุณ',
//         ),
//         // passwordInput()
//       ],
//     ),
//   );
// }

class SignButton extends StatelessWidget {
  final VoidCallback onPressedRegister;
  final VoidCallback onPressedEnter;

  SignButton({Key key, this.onPressedRegister, this.onPressedEnter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            height: WholaySpace.buttonHeight,
            margin: EdgeInsets.only(right: 5.0),
            child: BorderHighlightButton(
              caption: 'ลงทะเบียน',
              onPressed: onPressedRegister,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: WholaySpace.buttonHeight,
            margin: EdgeInsets.only(left: 5.0),
            child: RaisedButton(
              child: Text('เข้าใช้',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              onPressed: onPressedEnter,
            ),
          ),
        ),
      ],
    );
  }
}

// Widget signButton(BuildContext context, GlobalKey<FormState> formKey) {
//   return  Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Expanded(
//         child: Container(
//           height: WholaySpace.buttonHeight - 2,
//           // margin: EdgeInsets.only(left: WholaySpace.edgeHorizontal, right: 5.0),
//           margin: EdgeInsets.only(right: 5.0),
//           child: OutlineButton(
//             color: Colors.white,
//             borderSide: BorderSide(
//               color: WholayColors.primary,
//               width: WholaySpace.borderSize,
//             ),
//             child: Text('ลงทะเบียน'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => UserAcctEntryPage()),
//               );
//             },
//           ),
//         ),
//       ),
//       Expanded(
//         child: Container(
//           height: WholaySpace.buttonHeight,
//           // margin: EdgeInsets.only(left: 5.0, right: WholaySpace.edgeHorizontal),
//           margin: EdgeInsets.only(left: 5.0),
//           child: RaisedButton(
//             child: Text(
//               'เข้าใช้',
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 fontFamily: Theme.of(context).textTheme.button.fontFamily,
//                 letterSpacing: Theme.of(context).textTheme.button.letterSpacing,
//                 fontSize: Theme.of(context).textTheme.button.fontSize,
//                 fontStyle: Theme.of(context).textTheme.button.fontStyle,
//               ),
//             ),
//             onPressed: () {
//             },
//           ),
//         ),
//       ),
//     ],
//   );
// }

Widget socialText(BuildContext context) {
  double _screenWidth = MediaQuery.of(context).size.width;
  double _fontSize = (_screenWidth < WholaySpace.minScreenWidth) ? 12.0 : 14.0;

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Expanded(
        child: Container(
          padding: EdgeInsets.only(right: 10.0),
          child: lineDivide(WholayColors.textSecondary),
        ),
      ),
      Container(
        child: Center(
          child: Text(
            'เข้าใช้ด้วยบัญชี Social Network',
            style: TextStyle(
              fontFamily: WholayFonts.decoratedFontName,
              color: WholayColors.textSecondary,
              fontSize: _fontSize,
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 10.0),
          child: lineDivide(WholayColors.textSecondary),
        ),
      ),
    ],
  );
}

// Widget forgotPassword() {
//   return Container(
//     alignment: Alignment.bottomRight,
//     child: FlatButton.icon(
//       color: WholayColors.backgroundMain,
//       highlightColor: WholayColors.backgroundMain,
//       splashColor: WholayColors.backgroundMain,
//       icon: Icon(Icons.help, color: WholayColors.textBackgroundMain,),
//       label: Text('ลืมรหัสผ่าน', style: TextStyle(fontSize: 12.0, color: WholayColors.textBackgroundMain),),
//       onPressed: () {

//       },
//     ),
//   );
// }
