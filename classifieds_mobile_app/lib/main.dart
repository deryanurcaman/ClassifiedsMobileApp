import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/Pages/Welcome/welcome_page.dart';
import 'package:classifieds_mobile_app/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future testData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    var data = await db.collection('products').get();
    var details = data.docs.toList();
    details.forEach((element) {});
  }

  @override
  Widget build(BuildContext context) {
    testData();
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
