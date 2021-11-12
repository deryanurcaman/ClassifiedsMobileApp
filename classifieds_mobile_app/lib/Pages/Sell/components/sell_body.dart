import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../palette.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName = TextEditingController();
    TextEditingController _controllerPrice = TextEditingController();
    TextEditingController _controllerDescription = TextEditingController();
    return Container(
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
            child: Row(
              children: [
                Container(
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          "Upload Image of The Product:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: four,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 20),
                                  ),
                                  onPressed: _pickImage,
                                  child: Icon(
                                    Icons.photo_library,
                                    color: one,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: four,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20),
                              ),
                              onPressed: () {
                                if (_controllerName != null &&
                                    _controllerPrice != null &&
                                    _controllerDescription != null) {
                                  Product newPost = Product(
                                      name: _controllerName.text,
                                      price: _controllerPrice.text,
                                      description: _controllerDescription.text,
                                      image: "assets/images/no.png",
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
                              )),
                        ),
                      ),
                    )
                  ]),
                ),
              ],
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
        _imageFile = pickedFile!;
      });
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }
}
