import 'package:classifieds_mobile_app/Pages/Products/components/product_body.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/bottom_bar.dart';

import 'package:classifieds_mobile_app/palette.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
        backgroundColor: five,
        title: Text("Electronics"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
  body: Padding(
    padding: const EdgeInsets.only(top: 15.0),
    child: Body(),
  ),
  bottomNavigationBar: BottomBar()
);
}
}
