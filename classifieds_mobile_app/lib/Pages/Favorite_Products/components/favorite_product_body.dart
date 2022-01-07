import 'package:classifieds_mobile_app/Pages/Favorite_Products/components/favorite_product_card.dart';
import 'package:classifieds_mobile_app/Pages/Favorite_Products/favorite_product_detail.dart';
import 'package:classifieds_mobile_app/firestore_helper.dart';
import 'package:classifieds_mobile_app/models/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> favorite_products = [];

  @override
  void initState() {
    // TODO: implement initState
    FirestoreHelper.getFavProductList().then((value) {
      setState(() {
        favorite_products = value;
      });
    });
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: favorite_products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => FavoriteProductCard(
                      product: favorite_products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: favorite_products[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}
