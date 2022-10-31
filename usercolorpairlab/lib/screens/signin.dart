// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usercolorpairlab/screens/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController _EmailController = TextEditingController();
TextEditingController _PassController = TextEditingController();
const String _EmailHintText = "Email";
const String _PassHintText = "Password";
Future _logout() async {
  await FirebaseAuth.instance.signOut();
  print("current user: ${FirebaseAuth.instance.currentUser}");
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    _logout();
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
              _TextFormField(_EmailController, _EmailHintText),
              _TextFormField(_PassController, _PassHintText),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _EmailController.text,
                        password: _PassController.text,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                    if (FirebaseAuth.instance.currentUser != null) {
                      print("user is NOT null");
                    }
                    print(
                        "current user: ${FirebaseAuth.instance.currentUser?.email ?? "lol"}");
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
                  _EmailController.text = "a@a.com";
                  _PassController.text = "12341234";
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
