import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';

class AddAndFav extends StatefulWidget {
  const AddAndFav({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<AddAndFav> createState() => _AddAndFavState();
}

class _AddAndFavState extends State<AddAndFav> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              if (!favorite_products.contains(widget.product)) {
                favorite_products.add(widget.product);
              }
            },
            icon: Image.asset(
              "assets/icons/iheart.png",
            ),
          ),
        ),
        Container(
          color: four,
          child: SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () { _onShare(context);},
                color: one,
              )),
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: four,
            onPressed: () {
              if (!offers.contains(widget.product)) {
                offers.add(widget.product);
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

  _onShare(BuildContext context)  {
    final RenderBox box = context.findRenderObject() as RenderBox;

    
       Share.share(widget.product.image,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    
  }
}
