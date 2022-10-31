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
  clearEmailPassColor_Controllers();
  // print("current user: ${FirebaseAuth.instance.currentUser}");
}

void clearEmailPassColor_Controllers() {
  Registration.emailController.clear();
  Registration.passController.clear();
  Registration.colorController.clear();
}
