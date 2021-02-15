import 'package:flutter/material.dart';
import 'package:instanews/pages/home_page.dart';
import 'package:instanews/pages/registration.dart';
import 'package:instanews/services/auth_class.dart';
//import 'package:instanews/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  /* final Function toggleview;
  LoginPage({this.toggleview}); */

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //bool _autoValidate = false;
  AuthService _authservice = AuthService();
  String email = "";
  String password = "";
  String error = "";

  Widget logo() {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 48.0,
      child: Image.asset("assets/images/login.png"),

      /* Text("Sign In page") */
    );
  }

  _emailtextField() {
    return TextFormField(
      autocorrect: true,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      onChanged: (val) {
        setState(() {
          email = val;
        });
      },
      validator: (val) => val.isEmpty ? "Enter a valid email " : null,
      //initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
          hintText: "Enter email",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }

  Widget passwordField() {
    return TextFormField(
      autocorrect: true,
      controller: passwordController,
      keyboardType: TextInputType.emailAddress,

      obscureText: true,
      onChanged: (val) {
        setState(() {
          password = val;
        });
      },
      validator: (val) =>
          val.length < 6 ? "Enter a password greater than 6 words " : null,
      //initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
          hintText: "Enter password",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }

  Widget signinButton() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          dynamic result = _authservice.signInWithEmail(email, password);
          if (result == null) {
            setState(() {
              error = "Could't sign with those credential";
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
      child: Text('Log In', style: TextStyle(color: Colors.white)),
    );
  }

  Widget forgotButton() {
    return FlatButton(
      child: Text('Forgot password?',
          style: TextStyle(
            color: Colors.white,
          )),
      padding: EdgeInsets.all(12),
      color: Colors.lightBlueAccent,
      onPressed: () {},
    );
  }

  Widget newUserSignUp() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("New to InstaNews"),
        FlatButton(
          child: Text("Register Here"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => RegistrationPage()));
          },
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        /*  actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            onPressed: () {
              widget.toggleview();
            },
            label: Text("Sign Up"),
          )
        ], */
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
      body: Center(
        child: Form(
          key: _formKey,
          // ignore: deprecated_member_use

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
                signinButton(),
                SizedBox(
                  height: 20,
                ),
                forgotButton(),
                newUserSignUp(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
