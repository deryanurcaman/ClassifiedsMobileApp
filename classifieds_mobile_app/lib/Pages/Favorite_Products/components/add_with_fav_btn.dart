import 'package:classifieds_mobile_app/Pages/Favorite_Products/components/favorite_product_body.dart';
import 'package:classifieds_mobile_app/models/Product.dart';
import 'package:classifieds_mobile_app/models/offered_products.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

import '../../../firestore_helper.dart';
import '../favorite_products_view.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            ),
            onPressed: () {
              //favorite_products.remove(widget.product);

              setState(() {
                FirestoreHelper.deleteFavProduct(widget.product.id);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return FavoriteProducts();
                //     },
                //   ),
                // );
              });
            },
            child: Image.asset(
              "assets/icons/delete.png",
              height: 25,
            ),
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
            onPressed: () async {
              {
                OfferedProduct newOfferedProduct = OfferedProduct(
                    user_id: FirebaseAuth.instance.currentUser!.uid,
                    product_id: widget.product.id);

                FirestoreHelper.addOfferedProduct(newOfferedProduct);
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
      final ByteData bytes = await NetworkAssetBundle(Uri.parse(widget.product.image)).load("");
      await WcFlutterShare.share(
          sharePopupTitle: 'share',
          text: "Product: " +
              widget.product.name +
              "\n" +
              "Price:" +
              widget.product.price +
              "\$" +
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
