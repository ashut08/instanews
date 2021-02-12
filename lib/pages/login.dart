import 'package:flutter/material.dart';
//import 'package:instanews/pages/home_page.dart';
import 'package:instanews/widgets/sigin_widget.dart';

class LoginPage extends StatefulWidget {
  final Function toggleview;
  LoginPage({this.toggleview});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "InstaNews",
          style: TextStyle(
              height: 1.25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Raleway'),
        ),
      ),
      body: SignInWidget(),
    );
  }
}
