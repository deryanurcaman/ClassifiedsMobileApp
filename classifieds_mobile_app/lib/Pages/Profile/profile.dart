import 'package:classifieds_mobile_app/Pages/Favorite_Products/favorite_products_view.dart';
import 'package:classifieds_mobile_app/Pages/Home/home_page.dart';
import 'package:classifieds_mobile_app/Pages/Login/login_page.dart';
import 'package:classifieds_mobile_app/Pages/Offers/offers_view.dart';
import 'package:classifieds_mobile_app/Pages/Posts/posts_view.dart';
import 'package:classifieds_mobile_app/Pages/Sell/sell.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/User.dart';
import '../../palette.dart';
import 'components/numbers_widget copy.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User_Account user;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    Home(),
    FavoriteProducts(),
    Sell(),
    Offers(),
    Posts(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: two,
        appBar: AppBar(
          backgroundColor: five,
          title: Text("Profile"),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
        ),
        body: Column(children: [
          const SizedBox(height: 150),
          buildName(widget.user),
          const SizedBox(height: 48),
          NumbersWidget(),
          const SizedBox(height: 100),
          SizedBox(
              height: 50,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: four,
                  ),
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
                ),
              )),
        ]),
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
              //_getUserName();
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

  Widget buildName(User_Account user) => Column(
        children: [
          Text(
            user.fullName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.mail,
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          )
        ],
      );
}
