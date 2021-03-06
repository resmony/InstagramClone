import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/models/user_data.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var signedInUser = authResult.user;

      if (signedInUser != null) {
        _firestore
            .collection('/users')
            .document(signedInUser.uid)
            .setData({'name': name, 'email': email, 'profileImageURL': ''});
        Provider.of<UserData>(context).currentUserId = signedInUser.uid;
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  static void logOut() {
    _auth.signOut();
    // Navigator.pushReplacementNamed(context, LoginPage.id);
  }

  static void logIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
