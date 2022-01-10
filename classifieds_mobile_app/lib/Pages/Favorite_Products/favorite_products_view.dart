import 'package:classifieds_mobile_app/Pages/Favorite_Products/components/favorite_product_body.dart';
import 'package:classifieds_mobile_app/Pages/Home/home_page.dart';
import 'package:classifieds_mobile_app/Pages/Offers/offers_view.dart';
import 'package:classifieds_mobile_app/Pages/Posts/posts_view.dart';
import 'package:classifieds_mobile_app/Pages/Profile/profile.dart';
import 'package:classifieds_mobile_app/Pages/Sell/sell.dart';
import 'package:classifieds_mobile_app/Pages/Signup/signup_page.dart';
import 'package:classifieds_mobile_app/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/palette.dart';

class FavoriteProducts extends StatefulWidget {
  @override
  State<FavoriteProducts> createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {
  int _selectedIndex = 1;

  List<Widget> _widgetOptions = [
    Home(),
    FavoriteProducts(),
    Sell(),
    Offers(),
    Posts(),
  ];

  static final FirebaseFirestore db = FirebaseFirestore.instance;

  late User_Account user;

  @override
  void initState() {
    // TODO: implement initState
    if (mounted) {
      getUser().then((value) {
        setState(() {
          user = value;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: five,
          title: Text("Favorite Products"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Profile(
                          user: user,
                        );
                      },
                    ),
                  );
                },
                icon: Icon(Icons.person))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Body(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: five,
          iconSize: 40,
          selectedItemColor: one,
          unselectedItemColor: three,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return _widgetOptions.elementAt(_selectedIndex);
                },
              ),
            );
          },
          items: [
            BottomNavigationBarItem(
                icon: new Icon(EvaIcons.home), title: new Text("Home")),
            BottomNavigationBarItem(
                icon: new Icon(EvaIcons.heart), title: new Text("Favorites")),
            BottomNavigationBarItem(
                icon: new Icon(EvaIcons.plus), title: new Text("Sell")),
            BottomNavigationBarItem(
                icon: new Icon(EvaIcons.inbox), title: new Text("My Offers")),
            BottomNavigationBarItem(
                icon: new Icon(EvaIcons.image), title: new Text("My Posts")),
          ],
        ));
  }

  static Future<User_Account> getUser() async {
    User_Account user;
    var data = await db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    user = await User_Account.fromMap(data);
    return user;
  }
}
