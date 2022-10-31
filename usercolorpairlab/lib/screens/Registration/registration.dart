import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registration {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController colorController = TextEditingController();
}

String getEmailHintText() {
  return "Email";
}

String getPassHintText() {
  return "Password";
}

String getColorHintText() {
  return "Color";
}

Future logout() async {
  await FirebaseAuth.instance.signOut();
  // print("current user: ${FirebaseAuth.instance.currentUser}");
}
