import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/material.dart';

import '../favorite_products_view.dart';

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
          padding: EdgeInsets.all(8),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Image.asset(
              "assets/icons/delete.png",
            ),
            onPressed: () {
              favorite_products.remove(product);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FavoriteProducts();
                  },
                ),
              );
            },
            iconSize: 50,
          ),
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: four,
            onPressed: () {
              {
                if (!offers.contains(product)) {
                  offers.add(product);
                }
              }
            },
            child: Text(
              "Bid On Item".toUpperCase(),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
