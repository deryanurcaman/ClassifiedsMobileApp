import 'package:classifieds_mobile_app/Pages/Products/components/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'User.dart';

class FirestoreHelper {
  // to be able to access to db from different files without creating FirestoreHelper class instance => static
  // if a data member is static, it can be accessed without creating an object
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
      // document is a input parameter
      // convert each document to EventDetail
      // create a list of EventDetail objects

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
}
