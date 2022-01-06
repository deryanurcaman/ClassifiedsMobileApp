import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> login(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return user?.uid ?? ""; // if uid is null return empty text
  }

  Future<String> signUp(String email, String password, String fullName) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    print(user?.uid);
    db
        .collection("users")
        .doc(user?.uid)
        .set({"fullName": fullName, "email": email, "password": password});
    return user?.uid ?? "";
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

//This will be useful when we need to check whether a user is logged in or not
  Future<User?> getUser() async {
    User? user = await _firebaseAuth.currentUser;
    return user;
  }
}
