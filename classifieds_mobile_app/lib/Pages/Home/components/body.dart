import 'package:classifieds_mobile_app/Pages/Products/products_view.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: three,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
                child: Text(
              "CATEGORIES",
              style: TextStyle(fontSize: 32),
            )),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: one,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  child: ListTile(
                      title:
                          Text("All Products", style: TextStyle(fontSize: 20)),
                      leading: Image.asset("assets/icons/all.png")),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Products();
                        },
                      ),
                    );
                  },
                ),
              )),
          Divider(
            thickness: 2,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: one,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  child: ListTile(
                      title:
                          Text("Electronics", style: TextStyle(fontSize: 20)),
                      leading: Image.asset("assets/icons/laptop.png")),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Products();
                        },
                      ),
                    );
                  },
                ),
              )),
          Divider(
            thickness: 2,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: one,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  child: ListTile(
                      title: Text("Household Goods",
                          style: TextStyle(fontSize: 20)),
                      leading: Image.asset("assets/icons/frame.png")),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Products();
                        },
                      ),
                    );
                  },
                ),
              )),
          Divider(
            thickness: 2,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: one,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  child: ListTile(
                      title: Text("Stationery", style: TextStyle(fontSize: 20)),
                      leading: Image.asset("assets/icons/stationery.png")),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Products();
                        },
                      ),
                    );
                  },
                ),
              )),
          Divider(
            thickness: 2,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: one,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  child: ListTile(
                      title: Text("Clothes", style: TextStyle(fontSize: 20)),
                      leading: Image.asset("assets/icons/clothes.png")),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Products();
                        },
                      ),
                    );
                  },
                ),
              )),
          Divider(
            thickness: 2,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: one,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  child: ListTile(
                      title: Text("Sports", style: TextStyle(fontSize: 20)),
                      leading: Image.asset("assets/icons/sport.png")),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Products();
                        },
                      ),
                    );
                  },
                ),
              )),
          Divider(
            thickness: 2,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: one,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  child: ListTile(
                      title: Text("Books", style: TextStyle(fontSize: 20)),
                      leading: Image.asset("assets/icons/book.png")),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Products();
                        },
                      ),
                    );
                  },
                ),
              )),
          Divider(
            thickness: 2,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: one,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  child: ListTile(
                      title: Text("Cosmetics", style: TextStyle(fontSize: 20)),
                      leading: Image.asset("assets/icons/cosmetics.png")),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Products();
                        },
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
