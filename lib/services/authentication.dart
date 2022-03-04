// import 'dart:convert';

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowasla/models/user.dart' as Sys; 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mowasla/screens/signUp_screen.dart';


class Authentications {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();



  Future _userFromFirebase(u) async {
  final Sys.User _user = Sys.User();

    u.user?.uid != null ? _user.setUserId(u.user?.uid) : _user.setUserId(null);
    u.user?.email != null ? _user.setEmail(u.user?.email.trim()) : _user.setEmail(null);
    u.user?.phoneNumber != null
        ? _user.setPhone(u.user?.phoneNumber)
        : _user.setPhone(01067742353);
    u.user?.displayName != null
        ? _user.setName(u.user?.displayName)
        : _user.setName("ddd");
    u.user?.photoURL != null
        ? _user.setImagePath(u.user?.photoURL)
        : _user.setImagePath("images/profile.jpg");
    _user.setGender("female");
    _user.setNationality("Egyptian");
   
    return _user;
  }



  Future<Sys.User> signUpWithEmailAndPassWord(String email, String password) async {
   final Sys.User _newUser = Sys.User();

   var user =  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    
  
    user != null ? _newUser.setEmail(email.trim()) :  Fluttertoast.showToast(msg: "user = null");

    return _newUser;

    // try {
    //   var user = await _firebaseAuth.createUserWithEmailAndPassword(
    //       email: email, password: password);
    //   _newUser.setEmail(email.trim());
    //   return  _newUser;
      
    // } on FirebaseAuthException catch (exception) {
    //   // print(exception);
    //   inspect(exception);
    //   print("test");
    //   // Fluttertoast.showToast(msg: exception.code);
    //   return  _newUser;
      
    //   // print(exception);
    //   // // Fluttertoast.showToast(msg: exception);
    // }

    
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential fireBaseUser = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      Sys.User user = await _userFromFirebase(fireBaseUser);
      user.setEmail(email);
      // user.(email);
      return user;
    } on FirebaseAuthException catch (exception) {
      // Fluttertoast.showToast(msg: exception.code);
      // print(exception);
    }
  }

  Future signInWithGoogle() async {
    final googleAccount = await _googleSignIn.signIn();
    if (googleAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        return _userFromFirebase(userCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Fluttertoast.showToast(msg: "Account Exisits");
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }
  }

  // Future signInWithFacebook() async {
  //   try {
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //     switch (loginResult.status) {
  //       case LoginStatus.success:
  //         final AuthCredential facebookCredential =
  //             FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //         final userCredential =
  //             await _firebaseAuth.signInWithCredential(facebookCredential);
  //         return _userFromFirebase(userCredential);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  // }

  // static void signOut() {
  //   _prefs?.clear();
  // }
}
