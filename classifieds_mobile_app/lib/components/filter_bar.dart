import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/palette.dart';

class FilterBar extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const FilterBar({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: two),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10000,
              height: 90,
              child: Container(
                color: three,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 10),
                    children: [
                      Column(children: [
                        IconButton(
                          icon: Image.asset("assets/icons/laptop.png"),
                          iconSize: 50,
                          onPressed: () {},
                        ),
                        Text('Electronics')
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(children: [
                          IconButton(
                            icon: Image.asset("assets/icons/frame.png"),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                          Text('Household Goods')
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(children: [
                          IconButton(
                            icon: Image.asset("assets/icons/stationery.png"),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                          Text('Stationery')
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(children: [
                          IconButton(
                            icon: Image.asset("assets/icons/clothes.png"),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                          Text('Clothes')
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(children: [
                          IconButton(
                            icon: Image.asset("assets/icons/sport.png"),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                          Text('Sport')
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(children: [
                          IconButton(
                            icon: Image.asset("assets/icons/book.png"),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                          Text('Books')
                        ]),
                      ),
                    ]),
              ),
            )
          ]),
    );
  }
}