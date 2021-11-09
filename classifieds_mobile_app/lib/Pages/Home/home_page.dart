import 'package:classifieds_mobile_app/Pages/Home/components/body.dart';
import 'package:classifieds_mobile_app/Pages/Login/login_page.dart';
import 'package:classifieds_mobile_app/Pages/Signup/signup_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/palette.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    Body(),
    Login(),
    SignUp(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: five,
          title: Text("Home Page"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: five,
          iconSize: 40,
          selectedItemColor: one,
          unselectedItemColor: three,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(EvaIcons.home), title: new Text("Home")),
            BottomNavigationBarItem(
                icon: new Icon(EvaIcons.heart), title: new Text("Favorites")),
            BottomNavigationBarItem(
                icon: new Icon(EvaIcons.plus), title: new Text("Sell")),
            BottomNavigationBarItem(
                icon: new Icon(EvaIcons.inbox), title: new Text("Offers")),
            BottomNavigationBarItem(
                icon: new Icon(EvaIcons.image), title: new Text("Posts")),
          ],
        ));
  }
}
