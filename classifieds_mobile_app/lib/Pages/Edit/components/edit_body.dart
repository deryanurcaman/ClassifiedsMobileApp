import 'package:classifieds_mobile_app/Pages/Posts/posts_view.dart';
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
  bool _isEditingText = false;
  bool _isEditingText2 = false;
  bool _isEditingText3 = false;
  TextEditingController _editingController = TextEditingController();
  TextEditingController _editingController2 = TextEditingController();
  TextEditingController _editingController3 = TextEditingController();
  TextEditingController _editingController4 = TextEditingController();

  TextEditingController myController = TextEditingController()
    ..text = products[1].name;
  String initialText = "Initial Text";

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();

      _editingController = TextEditingController(text: post_products[1].name);
      _editingController2 = TextEditingController(text: post_products[1].price);
      _editingController3 =
          TextEditingController(text: post_products[1].description);
      _editingController4.addListener(() {
        print(_editingController.text);
      });
    }

    @override
    void dispose() {
      _editingController.dispose();
      _editingController2.dispose();
      _editingController3.dispose();
      _editingController4.dispose();

      super.dispose();
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: myController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _editPriceTextField(post_products[1].price),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _editDescriptionTextField(post_products[1].description),
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
    );
  }

  Widget _editNameTextField(initialText) {
    if (_isEditingText)
      return Center(
        child: TextField(
          decoration:
              InputDecoration(hintText: "Name", border: OutlineInputBorder()),
          style: TextStyle(color: five),
          onSubmitted: (newValue) {
            setState(() {
              post_products[1].name = newValue;
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: _editingController,
        ),
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Container(
        height: 50,
        width: 400,
        decoration:
            new BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _editPriceTextField(initialText) {
    if (_isEditingText2)
      return Center(
        child: TextField(
          decoration:
              InputDecoration(hintText: "Price", border: OutlineInputBorder()),
          style: TextStyle(color: five),
          onSubmitted: (newValue1) {
            setState(() {
              post_products[1].price = newValue1;
              _isEditingText2 = false;
            });
          },
          autofocus: true,
          controller: _editingController2,
        ),
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText2 = true;
        });
      },
      child: Container(
        height: 50,
        width: 400,
        decoration:
            new BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _editDescriptionTextField(initialText) {
    if (_isEditingText3)
      return Center(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Description", border: OutlineInputBorder()),
          style: TextStyle(color: five),
          onSubmitted: (newValue3) {
            setState(() {
              post_products[1].description = newValue3;
              _isEditingText3 = false;
            });
          },
          autofocus: true,
          controller: _editingController3,
        ),
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText3 = true;
        });
      },
      child: Container(
        height: 100,
        width: 400,
        decoration:
            new BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
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
