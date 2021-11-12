import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/services.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
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
                onPressed: () {
                  _shareImageAndText();
                },
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

  void _shareImageAndText() async {
    try {
      final ByteData bytes =
          await rootBundle.load('assets/images/computer.png');
      await WcFlutterShare.share(
          sharePopupTitle: 'share',
          subject: 'This is subject',
          text: 'This is text',
          fileName: 'share.png',
          mimeType: 'image/png',
          bytesOfFile: bytes.buffer.asUint8List());
    } catch (e) {
      print('error: $e');
    }
  }
}
