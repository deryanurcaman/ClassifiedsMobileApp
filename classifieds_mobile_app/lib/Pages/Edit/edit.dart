import 'package:classifieds_mobile_app/Pages/Edit/components/edit_body.dart';
import 'package:classifieds_mobile_app/Pages/Favorite_Products/favorite_products_view.dart';
import 'package:classifieds_mobile_app/Pages/Home/home_page.dart';
import 'package:classifieds_mobile_app/Pages/Offers/offers_view.dart';
import 'package:classifieds_mobile_app/Pages/Posts/posts_view.dart';
import 'package:classifieds_mobile_app/Pages/Profile/profile.dart';
import 'package:classifieds_mobile_app/Pages/Sell/sell.dart';
import 'package:classifieds_mobile_app/models/Product.dart';
import 'package:classifieds_mobile_app/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/palette.dart';

class Edit extends StatefulWidget {
  const Edit({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  int _selectedIndex = 2;

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
        backgroundColor: two,
        appBar: AppBar(
          backgroundColor: five,
          title: Text("Edit The Product"),
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
          child: Body(
            product: widget.product,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: five,
          iconSize: 40,
          selectedItemColor: three,
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
