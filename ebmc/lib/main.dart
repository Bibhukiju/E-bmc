import 'package:ebmc/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'homepage',
      routes: {
        'signup': (context) => SignUpPage(),
        'feedpage': (context) => FeedPage(),
        'loginpage': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
