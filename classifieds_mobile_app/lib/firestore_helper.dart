import 'package:classifieds_mobile_app/models/Product.dart';
import 'package:classifieds_mobile_app/models/favorite_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/User.dart';

class FirestoreHelper {
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static Future addNewProduct(Product products) {
    var result = db
        .collection('products')
        .add(products.toMap())
        .then((value) => print(value))
        .catchError((error) => print(error));
    return result;
  }

  // retrieve data
  static Future<List<Product>> getProductList() async {
    List<Product> details = [];

    var data = await db.collection('products').get();
    if (data != null) {
      details = data.docs.map((document) => Product.fromMap(document)).toList();

      int i = 0;
      details.forEach((detail) {
        detail.id = data.docs[i].id;
      });
    }
    return details;
  }

  static Future<List<Product>> deleteProduct(String documentId) async {
    await db.collection('products').doc(documentId).delete();
    return getProductList();
  }

  static Future addNewUser(User_Account users) {
    var result = db
        .collection('users')
        .add(users.toMap())
        .then((value) => print(value))
        .catchError((error) => print(error));
    return result;
  }

  // retrieve data
  static Future<List<User_Account>> getUserList() async {
    List<User_Account> details = [];

    var data = await db.collection('users').get();
    if (data != null) {
      details =
          data.docs.map((document) => User_Account.fromMap(document)).toList();

      int i = 0;
      details.forEach((detail) {
        detail.id = data.docs[i].id;
      });
    }
    return details;
  }

  // retrieve data
  static Future<List<Product>> getMyProductList() async {
    List<Product> myProducts = [];

    var data = await db
        .collection('products')
        .where('seller', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    myProducts =
        data.docs.map((document) => Product.fromMap(document)).toList();
    int i = 0;
    myProducts.forEach((detail) {
      detail.id = data.docs[i].id;
    });

    return myProducts;
  }
}
