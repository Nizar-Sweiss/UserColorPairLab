import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
