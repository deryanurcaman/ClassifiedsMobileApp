import 'package:classifieds_mobile_app/components/bottom_bar.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: one,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(child: Text("ELECTRONICS", style: TextStyle(fontSize: 32, color: five), )),
          ),
          Container(
            height: 200,
            color: two,
            child: Row(
              children: [Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset("assets/images/iphone.jpg", height: 150, width: 150),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Text("iPhone", style: TextStyle(fontSize: 32),),
                    Text("Description", style: TextStyle(fontSize: 16),)
                  ],
                ),
              ),
             
              ],
            ), 
          ),
          Divider(thickness: 2,),
          Container(
            height: 200,
            color: two,
            child: Row(
              children: [Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset("assets/images/airpods.jpg", height: 150, width: 150),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Text("AirPods", style: TextStyle(fontSize: 32),),
                    Text("Description", style: TextStyle(fontSize: 16),)
                  ],
                ),
              ),
             
              ],
            ), 
          ),
          Divider(thickness: 2,),
          Container(
            height: 200,
            color: two,
            child: Row(
              children: [Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset("assets/images/macbook.jpg", height: 150, width: 150,),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: [
                    Text("MacBook", style: TextStyle(fontSize: 32),),
                    Text("Description", style: TextStyle(fontSize: 16),)
                  ],
                ),
              ),
             
              ],
            ), 
          ),
        ],
      ),
    );
  }
}
