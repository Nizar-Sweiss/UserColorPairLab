import 'package:flutter/material.dart';
import 'package:usercolorpairlab/screens/Registration/signin.dart';
import 'package:usercolorpairlab/screens/Registration/signup.dart';
import 'package:usercolorpairlab/screens/home.dart';
// import 'package:routing_prep/main.dart';

// https://resocoder.com/2019/04/27/flutter-routes-navigation-parameters-named-routes-ongenerateroute/

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SignIn());
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
