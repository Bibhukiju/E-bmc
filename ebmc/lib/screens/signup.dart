import 'dart:convert';
import 'package:ebmc/screens/homepage.dart';

import './Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repass = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController otp = TextEditingController();
  bool _isLoading = false;

  signUp(
      {String username,
      String email,
      String firstPassword,
      String secondPassword}) async {
    Map data = {
      'name': username,
      'email': email,
      'first-password': firstPassword,
      'second-password': secondPassword,
    };
    var jsonResponse;
    var response = await http.post('https://ebmc.herokuapp.com/register/',
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      jsonResponse = jsonDecode(response.body);
      if (jsonResponse != null) {
        print(jsonResponse);
      }
    } else {
      print(response.body);
      print('hello');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              child: Text("logo of EBMC"),
              margin: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).size.height / 20, 0, 0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                buildText(
                    labelTxt: "Username",
                    textEdtCntrl: username,
                    hintTxt: "Enter Your Username"),
                buildText(
                    labelTxt: "Email",
                    textEdtCntrl: email,
                    hintTxt: "Enter Your Email"),
                buildText(
                    labelTxt: "Password",
                    textEdtCntrl: password,
                    hintTxt: "Enter Your Password"),
                buildText(
                    labelTxt: "Confirm Password",
                    textEdtCntrl: repass,
                    hintTxt: "Re-Enter Your Password To Confirm"),
                Align(
                  alignment: Alignment(1, 0),
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      signUp(
                          username: username.text,
                          email: email.text,
                          firstPassword: password.text,
                          secondPassword: repass.text);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => FeedPage()),
                          (route) => false);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Create account"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextField buildText(
      {String labelTxt, TextEditingController textEdtCntrl, String hintTxt}) {
    return TextField(
      controller: textEdtCntrl,
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelTxt,
          hintText: hintTxt,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )),
    );
  }
}
