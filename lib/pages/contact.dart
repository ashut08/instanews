import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: Text(
            "Contact US",
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
            ),
            Text(
              'Ashutosh Singh',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+917309453580',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 20.0,
                    ),
                  ),
                )),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'ashusingh.unch8@gmail.com',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ))
          ],
        ));
  }
}
