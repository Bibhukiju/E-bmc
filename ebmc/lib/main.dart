import 'package:ebmc/screens/feedpage.dart';
import 'package:ebmc/screens/hompage.dart';
import 'package:flutter/material.dart';
import 'screens/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => HomePage(),
        'signup': (context) => SignUpPage(),
        'feedpage': (context) => FeedPage(),
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
