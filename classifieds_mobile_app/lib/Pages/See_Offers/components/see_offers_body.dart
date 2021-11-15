import 'package:classifieds_mobile_app/Pages/Posts/posts_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../palette.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: three,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Oliver Smith',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'alex.smith@gmail.com',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 15),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      color: five,
                      textColor: one,
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
                      child: const Text(
                        'Accept',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    FlatButton(
                      color: five,
                      textColor: one,
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
                      child: const Text(
                        'Reject',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: three,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Lily Brown',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'alex.smith@gmail.com',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 15),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      color: five,
                      textColor: one,
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
                      child: const Text(
                        'Accept',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    FlatButton(
                      color: five,
                      textColor: one,
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
                      child: const Text(
                        'Reject',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: three,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'William Jones',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'alex.smith@gmail.com',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 15),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      color: five,
                      textColor: one,
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
                      child: const Text(
                        'Accept',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    FlatButton(
                      color: five,
                      textColor: one,
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
                      child: const Text(
                        'Reject',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
