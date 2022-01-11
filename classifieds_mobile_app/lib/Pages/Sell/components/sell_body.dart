import 'package:classifieds_mobile_app/Pages/Products/products_view.dart';
import 'package:classifieds_mobile_app/models/Product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../../firestore_helper.dart';
import '../../../palette.dart';

import 'dart:io';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File? _imageFile = null;
  final picker = ImagePicker();
  late String? _selectedFromMeasure;
  String imagePath = "uploads/no.png";

  Future uploadImageToFirebase(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });

    String fileName = basename(_imageFile!.path);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('uploads')
        .child('/$fileName');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': fileName});
    firebase_storage.UploadTask uploadTask;
    uploadTask = ref.putFile(io.File(_imageFile!.path), metadata);

    firebase_storage.UploadTask task = await Future.value(uploadTask);
    Future.value(uploadTask).then((value) {
      imagePath = value.ref.fullPath;
      print("Upload file path ${value.ref.fullPath}");
    }).onError((error, stackTrace) {
      print("Upload file path error ${error.toString()} ");
    });
  }

  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      child: Text("Electronics"),
      value: "Electronics",
    ),
    const DropdownMenuItem(
      child: Text("Household Goods"),
      value: "Household Goods",
    ),
    const DropdownMenuItem(
      child: Text("Books"),
      value: "Books",
    ),
    const DropdownMenuItem(
      child: Text("Sports"),
      value: "Sports",
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    _selectedFromMeasure = null;
    super.initState();
  }

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
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                children: [
                  Text(
                    "Upload Image of The Product:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            onPressed: () => uploadImageToFirebase(context),
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: DropdownButton(
                items: menuItems,
                hint: Text("Type"),
                onChanged: (value) {
                  setState(() {
                    _selectedFromMeasure = value.toString();
                  });
                },
                value: _selectedFromMeasure,
                isExpanded: true,
              ),
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
                                onPressed: () async {
                                  if (_controllerName != null &&
                                      _controllerPrice != null &&
                                      _controllerDescription != null) {
                                    Product newPost = Product(
                                        name: _controllerName.text,
                                        price: _controllerPrice.text,
                                        description:
                                            _controllerDescription.text,
                                        image: imagePath,
                                        seller: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        id: Uuid().v1(),
                                        type: _selectedFromMeasure!);

                                    FirestoreHelper.addNewProduct(newPost);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Products(type: "All");
                                        },
                                      ),
                                    );
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
                      ),
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

  // void _pickImage() async {
  //   try {
  //     final pickedFile = await _picker.getImage(source: ImageSource.gallery);
  //     setState(() {
  //       _imageFile = pickedFile!;
  //     });
  //   } catch (e) {
  //     print("Image picker error " + e.toString());
  //   }
  // }
}
