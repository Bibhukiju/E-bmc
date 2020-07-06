import 'dart:convert';
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

  signUp(String username, String email, String firstPassword,
      String secondPassword) async {
    Map data = {
      // 'name': username,
      'email': email,
      'first-password': firstPassword,
      'second-password': secondPassword,
    };
    print('\n' + email + '\n ' + firstPassword + '\n' + secondPassword);
    var jsonResponse;
    var response =
        await http.post('https://ebmc.herokuapp.com/register', body: data);
    if (response.statusCode == 201) {
      jsonResponse = jsonDecode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
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
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        // showDialog(
                        //     context: context,
                        //     child: SimpleDialog(
                        //       contentPadding: EdgeInsets.all(20),
                        //       titlePadding: EdgeInsets.all(20),
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(10)),
                        //       title: Text("Enter your OTP"),
                        //       children: <Widget>[
                        //         TextField(
                        //           controller: otp,
                        //           maxLength: 6,
                        //           decoration: InputDecoration(
                        //               border: InputBorder.none,
                        //               labelText: "Your OTP",
                        //               labelStyle: TextStyle(
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Colors.grey,
                        //               )),
                        //         ),
                        //         Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceEvenly,
                        //           children: <Widget>[
                        //             SimpleDialogOption(
                        //               child: Text(
                        //                 "Submit",
                        //                 style:
                        //                     TextStyle(color: Colors.lightBlue),
                        //               ),
                        //               onPressed: () {
                        //                 Navigator.pop(context);
                        //                 Navigator.of(context)
                        //                     .pushNamed('homepage');
                        //               },
                        //             ),
                        //             SimpleDialogOption(
                        //               child: Text(
                        //                 "Resend",
                        //                 style:
                        //                     TextStyle(color: Colors.lightBlue),
                        //               ),
                        //               onPressed: () {},
                        //             ),
                        //           ],
                        //         )
                        //       ],
                        //     ));
                        signUp(username.text, email.text, password.text,
                            repass.text);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()),
                            (Route<dynamic> route) => false);
                      },
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Create account"),
                        ),
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
