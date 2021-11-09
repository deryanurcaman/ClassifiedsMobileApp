import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
        Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: two,
              ),
            ),
            child: IconButton(
              icon: Image.asset(
                "assets/icons/shopping-cart.png",
                color: five,
              ),
              onPressed: () {},
            ),
          ),
      ],
    );
  }
}
