import 'package:classifieds_mobile_app/Pages/Products/components/product.dart';
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
          padding: EdgeInsets.all(8),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
            
          ),
          child: Image.asset("assets/icons/iheart.png",),
        ),
        SizedBox(
              height: 50,
              width: 200,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: four,
                onPressed: () {},
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
