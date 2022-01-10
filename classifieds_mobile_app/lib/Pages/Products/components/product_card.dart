import 'package:classifieds_mobile_app/models/Product.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    downloadURLExample(product.image);
    return GestureDetector(
      onTap: press,
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
              child: Hero(
                tag: "${product.id}",
                child:
                    Image.network(downloadURLExample(product.image).toString()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.name,
              style: TextStyle(color: five),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Future<String> downloadURLExample(String image) async {
    String downloadURL =
        await FirebaseStorage.instance.ref(image).getDownloadURL();
    return downloadURL;
  }

  getImage(String image) async {
    print("önce");
    try {
      String url = (await FirebaseStorage.instance.ref(image).getDownloadURL())
          .toString();
      return url;
    } catch (e) {
      print(e);
    }
  }
}
