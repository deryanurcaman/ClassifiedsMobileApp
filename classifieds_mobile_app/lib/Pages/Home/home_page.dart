import 'package:classifieds_mobile_app/Pages/Home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/bottom_bar.dart';
import 'package:classifieds_mobile_app/palette.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
        backgroundColor: five,
        title: Text("Home Page"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
  body: Body(),
  bottomNavigationBar: BottomBar()
);
}
}
