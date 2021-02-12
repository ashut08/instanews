import 'package:flutter/material.dart';
import 'package:instanews/widgets/registration_widget.dart';

class RegistrationPage extends StatefulWidget {
  final Function toggleview;
  RegistrationPage({this.toggleview});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
      body: SignUp(),
    );
  }
}
