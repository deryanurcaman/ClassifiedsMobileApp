import 'package:classifieds_mobile_app/Pages/Favorite_Products/favorite_products_view.dart';
import 'package:classifieds_mobile_app/Pages/Offers/offers_view.dart';
import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/Pages/See_Offers/see_offers.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/material.dart';

class AddAndFav extends StatelessWidget {
  const AddAndFav({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Container(margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: ElevatedButton(
                  child: Text(
                    "Edit",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: four,
                    fixedSize: Size(200, 50),
                  ),
                  onPressed: () {},
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: ElevatedButton(
                    child: Text(
                      "See offers for this product",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: four,
                      fixedSize: Size(300, 50),
                    ),
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SeeOffers();
                        },
                      ),
                    );
                  },
                  ),
                ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 50,
        //   width: 200,
        //   child: FlatButton(
        //     shape:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //     color: four,
        //     onPressed: () {},
        //     child: Text(
        //       "Teklif Verildi".toUpperCase(),
        //       style: TextStyle(
        //         fontSize: 17,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
