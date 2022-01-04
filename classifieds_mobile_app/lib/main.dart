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
    // async => while you download the records, you can still interact with the app. Processing in the back ground.
    FirebaseFirestore db = FirebaseFirestore.instance;
    var data = await db
        .collection('products') // collection - table
        .get(); // await => unless my data is downloaded and assigned to the data variable, do not go to the next line.
    var details = data.docs.toList(); // documents - records - rows
    details.forEach((element) {
      print(element.id); // document garip id
    });
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
