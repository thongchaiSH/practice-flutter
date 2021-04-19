import 'dart:math';

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool loginMode = true;

  GlobalKey<FormState> formKey = GlobalKey();
  String username = "";
  String email = "";
  String password = "";

  void submit() {
    if (!formKey.currentState.validate()) {
      return;
    }

    FocusScope.of(context).unfocus(); //hide keybord
    print("Submited");

    formKey.currentState.save();
    print("Username $username");
    print("Email $email");
    print("Password $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [FlutterLogo(), Text("Yout app name")],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loginMode
                          ? "Welcome to the\nLogin Screen"
                          : "Start usering this app by\ncomplete this form",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      loginMode
                          ? "Login to your account"
                          : "Create new account",
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  children: [
                    if (loginMode == false)
                      TextFormField(
                        key: ValueKey("username"),
                        validator: (value) {
                          if (value.isEmpty || value.length < 4) {
                            return "Username must be at least 4 charector";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          username = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "Username"),
                      ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key: ValueKey("email"),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email), labelText: "Email"),
                      validator: (value) {
                        if (value.isEmpty || !value.contains("@")) {
                          return "Please input a valid e-mail address";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                    TextFormField(
                      key: ValueKey("password"),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock), labelText: "Password"),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return "Username must be at least 6 charector";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    padding: EdgeInsets.all(17),
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text(
                      loginMode ? "Login" : "Sign up",
                      style: TextStyle(fontSize: 18, letterSpacing: 2),
                    ),
                    onPressed: submit,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        loginMode
                            ? "Don't have an acouunt yet?"
                            : "Already have an account?",
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(17),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Text(
                          loginMode ? "Sign up" : "Login",
                          style: TextStyle(fontSize: 18, letterSpacing: 1),
                        ),
                        textColor: Colors.blue,
                        onPressed: () {
                          setState(() {
                            loginMode = !loginMode;
                            print(loginMode);
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
