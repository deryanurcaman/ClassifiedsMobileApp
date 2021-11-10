import 'package:classifieds_mobile_app/Pages/Posts/components/post_card.dart';
import 'package:classifieds_mobile_app/Pages/Posts/post_detail.dart';
import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: post_products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => PostCard(
                      product: post_products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: post_products[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}
