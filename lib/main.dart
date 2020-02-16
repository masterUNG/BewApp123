import 'package:flutter/material.dart';
import 'package:enetb/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.white),
            ),
            primaryIconTheme: IconThemeData(color: Colors.white),
            primaryColor: Colors.deepOrange,
            accentColor: Color(0xffeaeaea),
            fontFamily: 'Quark'),
        title: 'enetb',
        home: SplashScreen());
  }
}
