// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController _EmailController = TextEditingController();
TextEditingController _PassController = TextEditingController();
const String _EmailHintText = "Email";
const String _PassHintText = "Password";
String _EmailErrorMsg = "Emtpy";

class _SignInState extends State<SignIn> {
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
              ElevatedButton(onPressed: () {}, child: const Text("Sign In")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont Have an Account,"),
                  TextButton(onPressed: () {}, child: const Text("Sign Up"))
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
  child: Text("Sign In"),
);
