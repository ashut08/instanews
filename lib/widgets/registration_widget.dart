import 'package:flutter/material.dart';
import 'package:instanews/pages/login.dart';
import 'package:instanews/services/auth_class.dart';

class SignUp extends StatefulWidget {
  final Function toogleview;
  SignUp({this.toogleview});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    AuthService _authservice = AuthService();
    _emailtextField() {
      return TextFormField(
        autocorrect: true,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
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
        autofocus: false,
        obscureText: false,
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
          widget.toogleview();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('SignUp', style: TextStyle(color: Colors.white)),
      );
    }

    Widget existingUserSignIn() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have a account"),
          FlatButton(
            child: Text("Login"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginPage()));
            },
          )
        ],
      );
    }

    Widget logo() {
      return CircleAvatar(
        backgroundColor: Colors.black,
        radius: 48.0,
        //child: Image.asset("assets/images/logo.jpg"),

        /* Text("Sign In page") */
      );
    }

    return Center(
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
              signupButton(),
              SizedBox(
                height: 20,
              ),
              existingUserSignIn(),
            ]),
          ),
        ),
      ),
    );
  }
}
