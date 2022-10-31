// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController _EmailController = TextEditingController();
TextEditingController _PassController = TextEditingController();
TextEditingController _ColorController = TextEditingController();
const String _EmailHintText = "Email";
const String _PassHintText = "Password";
const String _ColorHintText = "Color";

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _SignInText,
              _TextFormField(_EmailController, _EmailHintText),
              _TextFormField(_PassController, _PassHintText),
              _TextFormField(_ColorController, _ColorHintText),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _EmailController.text,
                        password: _PassController.text,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                    debugPrint("SignUp Preesed");
                  },
                  child: const Text("Sign Up")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an Account,"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
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
  child: Text("Sign Up"),
);
