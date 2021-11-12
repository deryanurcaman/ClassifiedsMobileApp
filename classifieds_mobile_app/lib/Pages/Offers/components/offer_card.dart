import 'dart:ui';
import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatefulWidget {
  final Product product;
  final VoidCallback press;
  const OfferCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
                padding: EdgeInsets.all(kDefaultPaddin),
                decoration: BoxDecoration(
                  color: two,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                        decoration: new BoxDecoration(color: Colors.white),
                        alignment: Alignment.center,
                        height: 240,
                        child: Image.asset(widget.product.image)),
                    Align(
                      alignment: Alignment.bottomRight,
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "[Waiting]",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              widget.product.name,
              style: TextStyle(color: five),
            ),
          ),
          Text(
            "\$${widget.product.price + "\$"}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
