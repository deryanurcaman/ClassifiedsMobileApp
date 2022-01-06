import 'package:classifieds_mobile_app/Pages/Posts/posts_view.dart';
import 'package:classifieds_mobile_app/models/Product.dart';
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

  static TextEditingController nameController = TextEditingController()
    ..text = products[1].name;

  static TextEditingController priceController = TextEditingController()
    ..text = products[1].price;

  static TextEditingController descriptionController = TextEditingController()
    ..text = products[1].description;

  String newName = "";
  String newPrice = "";
  String newDescription = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                onChanged: (text) {
                  setState(() {
                    newName = text;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: priceController,
                onChanged: (text) {
                  setState(() {
                    newPrice = text;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: descriptionController,
                onChanged: (text) {
                  setState(() {
                    newDescription = text;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Change Image of The Product:",
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
                                    setState(() {
                                      post_products[1].name = newName;
                                      post_products[1].price = newPrice;
                                      post_products[1].description =
                                          newDescription;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Posts();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Edit The Item",
                                    style: TextStyle(color: one),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
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
