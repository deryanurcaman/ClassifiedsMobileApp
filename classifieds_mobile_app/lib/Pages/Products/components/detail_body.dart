import 'package:classifieds_mobile_app/Pages/Products/components/product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/material.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_top.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                   height: 500,
                  decoration: BoxDecoration(
                    color: two,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Description(product: product),
                      AddAndFav(product: product),
                    ],
                  ),
                ),
                ProductTop(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
