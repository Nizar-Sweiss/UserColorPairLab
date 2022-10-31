// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usercolorpairlab/FireBase/firebase_functions.dart';
import 'package:usercolorpairlab/screens/Registration/registration.dart';
import 'package:usercolorpairlab/screens/Registration/signin.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print("emailController: ${Registration.emailController.text}");
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          logout();
          Navigator.of(context).pushReplacementNamed('/');
        },
        tooltip: "Sign Out",
        child: Transform.rotate(
          angle: 180 * math.pi / 180,
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text(
              getUser(FirebaseAuth.instance.currentUser!.uid).toString(),
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
        ],
      ),
    );
  }
}
