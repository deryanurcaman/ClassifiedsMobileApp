import 'package:classifieds_mobile_app/models/Product.dart';
import 'package:classifieds_mobile_app/models/favorite_product.dart';
import 'package:classifieds_mobile_app/models/offered_products.dart';
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
  static Future<List<Product>> getProductList(String type) async {
    List<Product> details = [];

    if(type=="all"){
      
    }

    
    
      if(type=="all"){
      var data = await db.collection('products').get();
      details = data.docs.map((document) => Product.fromMap(document)).toList();
      int i = 0;
      details.forEach((detail) {
        detail.id = data.docs[i].id;
        i++;
      });
      }
      else{
      var data = await db.collection('products').where('type', isEqualTo: type).get();
      details = data.docs.map((document) => Product.fromMap(document)).toList();
      int i = 0;
      details.forEach((detail) {
        detail.id = data.docs[i].id;
        i++;
      });
      }
      
    
    if(type=="all"){
      
    }
    return details;
  }

  static Future<List<Product>> deleteProduct(String documentId) async {
    await db.collection('products').doc(documentId).delete();
    return getProductList("all");
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
      i++;
    });

    return myProducts;
  }

  static Future addFavProduct(FavoriteProduct fav_products) {
    var result = db
        .collection('favorite_products')
        .add(fav_products.toMap())
        .then((value) => print(value))
        .catchError((error) => print(error));
    return result;
  }

  // retrieve data
  static Future<List<Product>> getFavProductList() async {
    List<Product> details = [];
    List fav_product_ids = [];

    await db
        .collection('favorite_products').where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        fav_product_ids.add(doc["product_id"]);
      });
    });

    await Future.forEach(fav_product_ids, (docId) async {
      var data = await db.collection('products').doc(docId.toString()).get();
      // print("Id:" + docId.toString());
      details.add(Product.fromMap(data));
    });

    return details;
  }

  static Future<List<Product>> deleteFavProduct(String documentId) async {
    var data = await db
        .collection('favorite_products')
        .where("product_id", isEqualTo: documentId)
        .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.docs.forEach((element) async {
      var doc_id = element.id;
      await db.collection('favorite_products').doc(doc_id).delete();
    });

    return getFavProductList();
  }



  static Future addOfferedProduct(OfferedProduct offered_products) {
    var result = db
        .collection('offered_products')
        .add(offered_products.toMap())
        .then((value) => print(value))
        .catchError((error) => print(error));
    return result;
  }

  // retrieve data
   static Future<List<Product>> getOfferedProductList() async {
    List<Product> detailss = [];
    List offered_product_ids = [];

    await db
        .collection('offered_products').where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        offered_product_ids.add(doc["product_id"]);
      });
      // print(offered_product_ids);
    });

    await Future.forEach(offered_product_ids, (docId) async {
      var data = await db.collection('products').doc(docId.toString()).get();
      // print("Id:" + docId.toString());
      detailss.add(Product.fromMap(data));
    });

    return detailss;
  }

  static Future<List<Product>> deleteOfferedProduct(String documentId) async {
    var data = await db
        .collection('offered_products')
        .where("product_id", isEqualTo: documentId)
        .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.docs.forEach((element) async {
      var doc_id = element.id;
      await db.collection('offered_products').doc(doc_id).delete();
    });

    return getOfferedProductList();
  }


  // retrieve data
   static Future<List<User_Account>> getOffersProductList(String product_id) async {
    List<User_Account> detailss = [];
    List offers_product_ids = [];

    await db
        .collection('offered_products').where('product_id', isEqualTo: product_id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        offers_product_ids.add(doc["user_id"]);
      });
      //print(offers_product_ids);
    });

    await Future.forEach(offers_product_ids, (docId) async {
      var data = await db.collection('users').doc(docId.toString()).get();
      print("Id:" + docId.toString());
      detailss.add(User_Account.fromMap(data));
    });

    return detailss;
  }

  static Future<List<Product>> deleteOffersProduct(String documentId, String user_id) async {
    var data = await db
        .collection('offered_products')
        .where("product_id", isEqualTo: documentId)
        .where("user_id", isEqualTo: user_id)
        .get();

    data.docs.forEach((element) async {
      var doc_id = element.id;
      await db.collection('offered_products').doc(doc_id).delete();
    });

    return getOfferedProductList();
  }
}
