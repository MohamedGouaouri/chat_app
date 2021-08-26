import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _signInFormKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter Yout email";
    }
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter Yout password";
    }
  }

  _sumbitAndSignIn() {
    if (_signInFormKey.currentState!.validate()) {
      // network call to login
      print(_email);
    }
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
                        _email = value;
                      });
                    },
                    validator: _emailValidator,
                    decoration: InputDecoration(
                      hintText: "Email",
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
                    onPressed: _sumbitAndSignIn,
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
