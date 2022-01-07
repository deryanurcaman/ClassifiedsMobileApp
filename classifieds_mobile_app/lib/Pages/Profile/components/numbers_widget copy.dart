import 'package:classifieds_mobile_app/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../firestore_helper.dart';

class NumbersWidget extends StatefulWidget {
  @override
  State<NumbersWidget> createState() => _NumbersWidgetState();
}

class _NumbersWidgetState extends State<NumbersWidget> {
  List<Product> favorite_products = [];
  List<Product> post_products = [];
  List<Product> offers = [];

  @override
  void initState() {
    // TODO: implement initState
    FirestoreHelper.getFavProductList().then((value) {
      setState(() {
        favorite_products = value;
      });
    });

    FirestoreHelper.getMyProductList().then((value) {
      setState(() {
        post_products = value;
      });
    });


    FirestoreHelper.getOfferedProductList().then((value) {
      setState(() {
        offers = value;
      });
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, post_products.length.toString(), 'Posts'),
          buildDivider(),
          buildButton(
              context, favorite_products.length.toString(), 'Favorites'),
          buildDivider(),
          buildButton(context, offers.length.toString(), 'Offers'),
        ],
      );

  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
