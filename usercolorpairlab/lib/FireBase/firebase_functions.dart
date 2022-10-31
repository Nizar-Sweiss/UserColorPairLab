import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/Registration/registration.dart';
import '../screens/home.dart';

class MyFireBaseFunctions {
  static FirebaseFirestore db = FirebaseFirestore.instance;
}

Future<void> signUp({
  required BuildContext context,
  bool withAutoSignIn = false,
}) async {
  bool isSignedUpSuccessfully = withAutoSignIn;
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: Registration.emailController.text,
      password: Registration.passController.text,
    );
    isSignedUpSuccessfully = true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  if (isSignedUpSuccessfully) {
    Map<String, dynamic> user = {
      "email": Registration.emailController.text,
      "role": "user",
      "color": Registration.colorController.text,
    };
    addUser(user);
  }
  if (isSignedUpSuccessfully && withAutoSignIn) {
    signIn(context);
  }
}

Future<void> signIn(BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: Registration.emailController.text,
      password: Registration.passController.text,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  if (FirebaseAuth.instance.currentUser != null) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}

void addUser(Map<String, dynamic> user) {
  MyFireBaseFunctions.db
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set(user)
      .onError((e, _) => print("Error writing document: $e"));
}

// Future<DocumentSnapshot<Map<String, dynamic>>>
getUser(var userID) {
  print("UserID: $userID");
  final docRef =
      MyFireBaseFunctions.db.collection("users").doc("Q0L8f700lvVc08kAXV9q");
  return docRef.snapshots().listen(
        (event) => print("current data: ${event.data()}"),
        onError: (error) => print("Listen failed: $error"),
      );
}
