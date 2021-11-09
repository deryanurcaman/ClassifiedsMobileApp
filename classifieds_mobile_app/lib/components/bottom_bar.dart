import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/palette.dart';

class BottomBar extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const BottomBar({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: five,
      iconSize: 40,
      selectedItemColor: one,
      unselectedItemColor: three,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(EvaIcons.home),
          title: new Text("Home")
        ),
        BottomNavigationBarItem(
          icon: new Icon(EvaIcons.heart),
          title: new Text("Favorites")
        ),
        BottomNavigationBarItem(
          icon: new Icon(EvaIcons.plus),
          title: new Text("Sell")
        ),
        BottomNavigationBarItem(
          icon: new Icon(EvaIcons.inbox),
          title: new Text("Offers")
        ),
        BottomNavigationBarItem(
          icon: new Icon(EvaIcons.image),
          title: new Text("Posts")
        ),
        

      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(color: two),
  //     child: Column(

  //         children: [
  //           SizedBox(
  //             height: 90,
  //             child: Container(
  //               color: three,
  //               child: Row(children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 10.0),
  //                   child: Column(children: [
  //                     IconButton(
  //                       icon: Image.asset("assets/icons/home.png"),
  //                       iconSize: 40,
  //                       onPressed: () {},
  //                     ),
  //                     Text('Home')
  //                   ]),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 20.0),
  //                   child: Column(children: [
  //                     IconButton(
  //                       icon: Image.asset("assets/icons/heart.png"),
  //                       iconSize: 20,
  //                       onPressed: () {},
  //                     ),
  //                     Text('Favorites')
  //                   ]),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 20.0),
  //                   child: Column(children: [
  //                     IconButton(
  //                       icon: Image.asset("assets/icons/plus.png"),
  //                       iconSize: 40,
  //                       onPressed: () {},
  //                     ),
  //                     Text('Sell')
  //                   ]),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 10.0),
  //                   child: Column(children: [
  //                     IconButton(
  //                       icon: Image.asset("assets/icons/shopping-cart.png"),
  //                       iconSize: 20,
  //                       onPressed: () {},
  //                     ),
  //                     Text('Bid On Items')
  //                   ]),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 20.0),
  //                   child: Column(children: [
  //                     IconButton(
  //                       icon: Image.asset("assets/icons/commercial.png"),
  //                       iconSize: 20,
  //                       onPressed: () {},
  //                     ),
  //                     Text('Posts')
  //                   ]),
  //                 ),
  //               ]),
  //             ),
  //           )
  //         ]),
  //   );
  // }
}
