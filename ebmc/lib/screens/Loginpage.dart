import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hidden = true;
  SharedPreferences sharedPreferences;
  final passkey = TextEditingController();
  final email = TextEditingController();
  login({String email, String password}) async {
    var jsonData;
    Map data = {'email': email, 'password': password};
    var response = await http.post('https://ebmc.herokuapp.com/login/',
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(data));
    print(response);
    print(data);
    if (response.statusCode == 200) {
      print("h");
      jsonData = jsonDecode(response.body);
      print(jsonData);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => FeedPage()),
          (Route<dynamic> route) => false);
    } else {
      print("bye");
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEmail = true;
    bool ispass = true;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                  child: Text(
                    "Hello",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 160, 0, 0),
                  child: Text(
                    "EBMCIANs",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260, 160, 0, 0),
                  child: Text(
                    ".",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passkey,
                    obscureText: this.hidden,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: hidden ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              hidden ? hidden = false : hidden = true;
                            });
                          },
                        ),
                        border: InputBorder.none,
                        labelText: "Password",
                        errorText: !ispass ? "not valid" : null,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                  ),
                  Container(
                    alignment: Alignment(1.0, 0),
                    padding: EdgeInsets.only(top: 15, left: 20),
                    child: InkWell(
                      child: Text(
                        "Forgot password??",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RaisedButton(
                    color: Colors.lightBlue,
                    onPressed: () => {
                      login(email: email.text, password: passkey.text),
                      setState(() {
                        passkey.text.length < 8
                            ? ispass = true
                            : ispass = false;
                      }),
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('New to e-bmc??'),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('signup');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
