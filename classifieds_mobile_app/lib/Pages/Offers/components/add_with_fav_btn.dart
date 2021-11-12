import 'package:classifieds_mobile_app/Pages/Offers/offers_view.dart';
import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

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
          // padding: EdgeInsets.all(8),
          // height: 50,
          // width: 200,
          // decoration: BoxDecoration(
          //   color: Color(0xFFFF6464),
          //   shape: BoxShape.rectangle,
          // ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: ElevatedButton(
                child: Text(
                  "Withdraw Offer",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: four,
                  fixedSize: Size(200, 50),
                ),
                onPressed: () {
                  offers.remove(widget.product);
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
