// ignore_for_file: unused_import

import 'package:flutter/material.dart';
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
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text("Hello"),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
        ],
      ),
    );
  }
}
