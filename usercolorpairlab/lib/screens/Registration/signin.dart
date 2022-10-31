// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usercolorpairlab/FireBase/firebase_functions.dart';
import 'package:usercolorpairlab/screens/Registration/registration.dart';
import 'package:usercolorpairlab/screens/Registration/signup.dart';

import '../home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    logout();
    super.initState();
  }

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
              ElevatedButton(
                  onPressed: () async {
                    signIn(context);
                  },
                  child: const Text("Sign In")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont Have an Account,"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: const Text("Sign Up"))
                ],
              ),
              InkWell(
                onTap: () {
                  Registration.emailController.text = "a@a.com";
                  Registration.passController.text = "12341234";
                },
                child: const Chip(label: Text("a@a")),
              )
            ],
          ),
        ),
      ),
    );
  }

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

var _SignInText = const Center(
  heightFactor: 18,
  child: Text("Sign In"),
);
