import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/Pages/Welcome/welcome_page.dart';
import 'package:classifieds_mobile_app/palette.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Classifieds Mobile App',
      theme: ThemeData(
        primaryColor: two,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Welcome(),
    );
  }
}
