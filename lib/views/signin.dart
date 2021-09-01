import 'dart:ui';

import 'package:chat_app/controllers/api_controller.dart';
import 'package:chat_app/views/home.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _signInFormKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  Widget watingWidget = SizedBox.shrink();
  bool loggedIn = false;
  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter Yout email";
    }
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter Yout password";
    }
  }

  Future<bool>? _submitAndSignIn() async {
    if (_signInFormKey.currentState!.validate()) {
      return await signIn(_username, _password);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign In",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
          Form(
            key: _signInFormKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                    validator: _usernameValidator,
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    validator: _passwordValidator,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  //color: Theme.of(context).primaryColor,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        watingWidget = FutureBuilder(
                            future: _submitAndSignIn(),
                            builder: (BuildContext context,
                                AsyncSnapshot<bool> snapshot) {
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator();
                              }
                              loggedIn = snapshot.data!;

                              if (!loggedIn) {
                                return Text(
                                  "Credentials error",
                                  style: TextStyle(color: Colors.red),
                                );
                              }
                              return SizedBox.shrink();
                            });
                      });

                      if (loggedIn) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      }
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                watingWidget
              ],
            ),
          ),
        ],
      ),
    );
  }
}
