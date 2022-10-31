// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unused_element, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usercolorpairlab/FireBase/firebase_functions.dart';
import 'package:usercolorpairlab/screens/Registration/registration.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _SignInText,
              _TextFormField(Registration.emailController, getEmailHintText()),
              _TextFormField(Registration.passController, getPassHintText()),
              _TextFormField(Registration.colorController, getColorHintText()),
              ElevatedButton(
                  onPressed: () async {
                    signUp(context: context, withAutoSignIn: true);
                  },
                  child: const Text("Sign Up")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an Account,"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Sign In"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final Center _SignInText = const Center(
    heightFactor: 18,
    child: Text("Sign Up"),
  );
  Padding _TextFormField(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
        ),
      ),
    );
  }
}
