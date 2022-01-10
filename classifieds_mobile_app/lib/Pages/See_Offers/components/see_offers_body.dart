import 'package:classifieds_mobile_app/Pages/Posts/post_detail.dart';
import 'package:classifieds_mobile_app/Pages/Posts/posts_view.dart';
import 'package:classifieds_mobile_app/firestore_helper.dart';
import 'package:classifieds_mobile_app/models/Product.dart';
import 'package:classifieds_mobile_app/models/User.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../palette.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<User_Account> users = [];

  @override
  void initState() {
    // TODO: implement initState
    FirestoreHelper.getOffersProductList(widget.product.id).then((value) {
      setState(() {
        users = value;
      });
    });
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: three,
              child: ListTile(
                title: Text(users[index].fullName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text(users[index].mail,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                trailing: Wrap(
                  spacing: 5,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: five),
                        onPressed: () {
                          setState(() {
                            FirestoreHelper.deleteOffersProduct(
                                widget.product.id, users[index].id);
                            FirestoreHelper.deleteFavProduct(widget.product.id);
                            FirestoreHelper.deleteProduct(widget.product.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Posts();
                                },
                              ),
                            );
                          });
                        },
                        child: Text("Accept")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: five),
                        onPressed: () {
                          setState(() {
                            FirestoreHelper.deleteOffersProduct(
                                widget.product.id, users[index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen(
                                    product: widget.product,
                                  );
                                },
                              ),
                            );
                          });
                        },
                        child: Text("Reject")),
                  ],
                ),
                onTap: () {},
              ),
            ),
          );
        });
  }
}
