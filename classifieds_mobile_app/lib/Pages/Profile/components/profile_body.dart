import 'package:classifieds_mobile_app/Pages/Login/login_page.dart';
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
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
            height: 100,
            color: three,
            child: Row(children: [
              Text(
                "Name: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Alex",
                style: TextStyle(fontSize: 20),
              )
            ]),
          ),
          Container(
            height: 100,
            color: three,
            child: Row(children: [
              Text(
                "Surname: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Smith",
                style: TextStyle(fontSize: 20),
              )
            ]),
          ),
          Container(
            height: 100,
            color: three,
            child: Row(children: [
              Text(
                "Email: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "alex.smith@gmail.com",
                style: TextStyle(fontSize: 20),
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            height: 100,
            width: 120,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
                );
              },
              child: Text(
                "Log Out",
                style: TextStyle(color: one, fontSize: 20),
              ),
              color: four,
            ),
          )
        ]),
      ),
    );
  }
}
