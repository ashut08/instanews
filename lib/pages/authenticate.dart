import 'package:flutter/material.dart';
import 'package:instanews/pages/login.dart';
import 'package:instanews/pages/registration.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showsignin = true;
  void toggleview() {
    setState(() => showsignin != showsignin);
  }

  @override
  Widget build(BuildContext context) {
    if (showsignin) {
      return LoginPage();
    } else {
      return RegistrationPage();
    }
  }
}
