import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wholay/views/mainViews/mainPage.dart';
import 'package:wholay/appVars.dart';
import 'package:wholay/models/userAccount_model.dart';
import 'package:wholay/constants/key.dart' as Local;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AccessInfo accessInfo = AccessInfo();
UserAccountModel userModel = UserAccountModel();
final storage = FlutterSecureStorage();

void main() async {
  // For the first phase, the orientation must only in portraint.
  String _usrEmail;

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );
  accessInfo.keepSignin = true;
  String signupReady = await storage.read(key: Local.Key.SIGNUPREADY);
  if (signupReady != null) {
    accessInfo.signupReady = true;
    userModel.userId = await storage.read(key: Local.Key.USER_UID);
    _usrEmail = await storage.read(key: Local.Key.USER_EMAIL);
    if ((_usrEmail == null) || (_usrEmail.trim().isEmpty)) {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseUser _fbUsr = await _auth.currentUser();
      _usrEmail = _fbUsr.email;
      await storage.write(key: Local.Key.USER_EMAIL, value: _usrEmail);
    }
    userModel.email = _usrEmail;
    userModel.getUserProfile();
    userModel.getUserInfo();
  } else {
    accessInfo.signupReady = false;
  }
  runApp(WholayApp());
}

class WholayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wholay',
      theme: wholayTheme(), // wholayTheme(context),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('th'), const Locale('en')],
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
      },
      // home: MainPage(),
    );
  }
}
