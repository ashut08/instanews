import 'package:flutter/material.dart';
import 'package:instanews/pages/home_page.dart';

class SignInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    //bool _autoValidate = false;

    Widget logo() {
      return CircleAvatar(
        backgroundColor: Colors.black,
        radius: 48.0,

        /* Text("Sign In page") */
      );
    }

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

    Widget signinButton() {
      return MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomePage()));
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      );
    }

    Widget forgotButton() {
      return FlatButton(
        child: Text(
          'Forgot password?',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {},
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
              signinButton(),
              SizedBox(
                height: 20,
              ),
              forgotButton(),
            ]),
          ),
        ),
      ),
    );
  }
}
