import 'package:classifieds_mobile_app/Pages/Offers/components/offer_card.dart';
import 'package:classifieds_mobile_app/Pages/Offers/offer_detail.dart';
import 'package:classifieds_mobile_app/models/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../firestore_helper.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
    List<Product> offers = [];

 @override
   void initState() {
     // TODO: implement initState
     FirestoreHelper.getOfferedProductList().then((value) {
       setState(() {
         offers = value;
       });
     });
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
                itemCount: offers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => OfferCard(
                      product: offers[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: offers[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}
