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
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "New Product",
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: five),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.comment,
                    color: Colors.black,
                  ),
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
                  icon: Icon(
                    Icons.price_change,
                    color: Colors.black,
                  ),
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
                  icon: Icon(
                    Icons.description,
                    color: Colors.black,
                  ),
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                                          horizontal: 20, vertical: 15),
                                    ),
                                    onPressed: _pickImage,
                                    child: Icon(
                                      Icons.photo_library,
                                      color: one,
                                      size: 20,
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
                                      horizontal: 35, vertical: 17),
                                ),
                                onPressed: () {
                                  if (_controllerName != null &&
                                      _controllerPrice != null &&
                                      _controllerDescription != null) {
                                    Product newPost = Product(
                                        name: _controllerName.text,
                                        price: _controllerPrice.text,
                                        description:
                                            _controllerDescription.text,
                                        image: "assets/images/no.png",
                                        seller: "Alex",
                                        id: "10",
                                        type: "electronics");
                                    setState(() {
                                      post_products.add(newPost);
                                      //print(newPost.name);
                                    });
                                  }
                                },
                                child: Text(
                                  "Post The Item",
                                  style: TextStyle(
                                      color: one,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
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
