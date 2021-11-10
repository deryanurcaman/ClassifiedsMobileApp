import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../palette.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName = TextEditingController();
    TextEditingController _controllerPrice = TextEditingController();
    TextEditingController _controllerDescription = TextEditingController();
    return Container(
      color: two,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerName,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerPrice,
              decoration: InputDecoration(
                hintText: "Price",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerDescription,
              decoration: InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: 200,
              child: Column(children: [
                Text("Upload An Image"),
                FlatButton(
                    color: five,
                    onPressed: _pickImage,
                    child: Icon(
                      Icons.photo_library,
                      color: one,
                    )),
                FlatButton(
                    color: four,
                    onPressed: () {
                      if (_controllerName != null &&
                          _controllerPrice != null &&
                          _controllerDescription != null) {
                        Product newPost = Product(
                            name: _controllerName.toString(),
                            price: _controllerPrice.toString(),
                            description: _controllerDescription.toString(),
                            image: "assets/images/macbook.jpg",
                            seller: "Alex",
                            id: "10");
                        setState(() {
                          post_products.add(newPost);
                          //print(newPost.name);
                        });
                      }
                    },
                    child: Text(
                      "Post The Item",
                      style: TextStyle(color: one),
                    ))
              ]),
            ),
          )
        ]),
      ),
    );
  }

  void _pickImage() async {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error " + e);
    }
  }
}
