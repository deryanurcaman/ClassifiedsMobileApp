import 'package:classifieds_mobile_app/Pages/Favorite_Products/favorite_products_view.dart';
import 'package:classifieds_mobile_app/Pages/Offers/offers_view.dart';
import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/material.dart';


class AddAndFav extends StatelessWidget {
  const AddAndFav({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          // padding: EdgeInsets.all(8),
          // height: 50,
          // width: 200,
          // decoration: BoxDecoration(
          //   color: Color(0xFFFF6464),
          //   shape: BoxShape.rectangle,
          // ),
          child: ElevatedButton(
            child: Text("Withdraw Offer", style: TextStyle(fontSize: 20),),
            style: ElevatedButton.styleFrom(primary: four, fixedSize: Size(200, 50),),
            onPressed: () {
              offers.remove(product);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Offers();
                  },
                ),
              );
            },
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
