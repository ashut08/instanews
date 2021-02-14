import 'package:flutter/material.dart';
import 'package:instanews/pages/home_page.dart';
import 'package:instanews/pages/login.dart';
import 'package:instanews/services/auth_class.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthService _authservice = AuthService();
  String email = "";
  String password = "";
  String error = "";
  Widget build(BuildContext context) {
    _emailtextField() {
      return TextFormField(
        autocorrect: true,
        keyboardType: TextInputType.emailAddress,
        onChanged: (val) {
          setState(() {
            email = val;
          });
        },
        validator: (val) => val.isEmpty ? "Enter valid email" : null,
        decoration: InputDecoration(
            hintText: "Enter email",
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );
    }

    Widget passwordField() {
      return TextFormField(
        onChanged: (val) {
          password = val;
        },
        validator: (val) =>
            val.length < 6 ? "Enter a password greater than 6 words " : null,

        obscureText: true,
        //initialValue: 'alucard@gmail.com',
        decoration: InputDecoration(
            hintText: "Enter password",
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );
    }

    Widget signupButton() {
      return MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            print(email);
            print(password);
            dynamic result =
                await _authservice.regWithEmailPassword(email, password);
            if (result == null) {
              setState(() {
                error = "plz supply valid input";
              });
            } else {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              print(result);
            }
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('SignUp',
            style: TextStyle(
              color: Colors.white,
            )),
      );
    }

    Widget existingUserSignIn() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have a account",
            style: TextStyle(color: Colors.black87, fontSize: 15),
          ),
          MaterialButton(
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.all(10),
            color: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    }

    Widget logo() {
      return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 48.0,
        child: Image.asset(
          "assets/images/signup.png",
          height: 200,
          width: 300,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "SignUp Page",
          style: TextStyle(
              height: 1.25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Raleway'),
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: <Widget>[
                logo(),
                SizedBox(
                  height: 30,
                ),
                _emailtextField(),
                SizedBox(
                  height: 8,
                ),
                passwordField(),
                SizedBox(height: 24.0),
                signupButton(),
                SizedBox(
                  height: 25,
                ),
                existingUserSignIn(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
