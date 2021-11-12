import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
        ClipRRect(
          borderRadius: BorderRadius.circular(35),
          
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
            onPressed: () {
              if (!favorite_products.contains(widget.product)) {
                favorite_products.add(widget.product);
              }
            },
            child: Icon(EvaIcons.heart),
          ),
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: four,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
              child: Icon(Icons.share),
              onPressed: () {
                _shareImageAndText();
              },
            )),
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

  void _shareImageAndText() async {
    try {
      final ByteData bytes = await rootBundle.load(widget.product.image);
      await WcFlutterShare.share(
          sharePopupTitle: 'share',
          text: "Product: " +
              widget.product.name +
              "\n" +
              "Price:" +
              widget.product.price +
              "\n" +
              widget.product.description,
          fileName: 'share.png',
          mimeType: 'image/png',
          bytesOfFile: bytes.buffer.asUint8List());
    } catch (e) {
      print('error: $e');
    }
  }
}
