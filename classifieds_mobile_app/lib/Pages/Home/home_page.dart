import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/bottom_bar.dart';
import 'package:classifieds_mobile_app/components/filter_bar.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:classifieds_mobile_app/components/filter_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: four,
          title: Text("Home Page"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
        ),
      body: Column(
          children: [FilterBar(), Spacer(), BottomBar()],
        )
    );
  }
}
