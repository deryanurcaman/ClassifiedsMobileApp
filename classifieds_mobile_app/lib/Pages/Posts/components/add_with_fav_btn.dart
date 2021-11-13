import 'package:classifieds_mobile_app/Pages/Edit/edit.dart';
import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:classifieds_mobile_app/Pages/See_Offers/see_offers.dart';
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
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ElevatedButton(
                        child: Text(
                          "Edit",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: four,
                          fixedSize: Size(200, 50),
                        ),
                        onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Edit();
                      },
                    ),
                  );},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: four,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          child: Icon(Icons.share),
                          onPressed: () {
                            _shareImageAndText();
                          },
                        )),
                  ),
                ],
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
              "Price: " +
              widget.product.price + "\$" +
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
