import 'package:flutter/material.dart';
import 'package:instanews/pages/home_page.dart';
import 'package:instanews/pages/login.dart';
import 'package:instanews/services/auth_class.dart';

class RegistrationPage extends StatefulWidget {
  /*  final Function toggleview;
  RegistrationPage({this.toggleview}); */

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    AuthService _authservice = AuthService();
    String email = "";
    String password = "";
    String error = "";
    _emailtextField() {
      return TextFormField(
        autocorrect: true,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        onChanged: (val) {
          setState(() {
            email = val;
          });
        },
        validator: (val) => val.isEmpty ? "Enter a name " : null,
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
        onChanged: (val) {
          password = val;
        },
        validator: (val) =>
            val.length < 6 ? "Enter a password greater than 6 words " : null,
        controller: passwordController,
        keyboardType: TextInputType.emailAddress,

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
            }
          }

          // widget.toogleview();
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        /*  actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            onPressed: () {
              widget.toggleview();
            },
            label: Text("Sign In"),
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
