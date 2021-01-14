import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About page",
          style: TextStyle(
              fontFamily: 'Raleway', fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Center(
        child: Text("This is abut page", style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
