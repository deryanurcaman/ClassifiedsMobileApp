import 'package:classifieds_mobile_app/Pages/Products/components/product.dart';
import 'package:classifieds_mobile_app/Pages/Products/components/detail_body.dart';
import 'package:classifieds_mobile_app/components/bottom_bar.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: five,
          title: Text("Detail Page"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
        ),
        body: Body(product: product,),
        bottomNavigationBar: BottomBar());
  }
}