import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usercolorpairlab/screens/Registration/signin.dart';

import '../screens/home.dart';

class MyFireBaseFunctions {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
}

Future<void> signUp({bool withAutoSignIn = false}) async {
  bool isSignedUpSuccessfully = withAutoSignIn;
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: MyFireBaseFunctions.emailController.text,
      password: MyFireBaseFunctions.passController.text,
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

  if (isSignedUpSuccessfully && withAutoSignIn) {
    // signIn();
  }
}

Future<void> signIn(BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: MyFireBaseFunctions.emailController.text,
      password: MyFireBaseFunctions.passController.text,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  if (FirebaseAuth.instance.currentUser != null) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }
}
