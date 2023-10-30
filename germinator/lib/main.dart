import 'package:flutter/material.dart';
import 'package:germinator/screens/landing.dart';
import 'package:germinator/screens/login.dart';
import 'package:germinator/screens/signup.dart';
import 'package:germinator/screens/plant.dart';
import 'package:germinator/screens/plantinfo.dart';
// import 'package:germinator/screens/profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Germinator",
      home: const Landing(),
      onGenerateRoute: (settings) {
        if (settings.name == '/login') {
          return MaterialPageRoute(builder: (context) => const LoginPage());
        }
        if (settings.name == '/signup') {
          return MaterialPageRoute(builder: (context) => const SignupPage());
        }
        if (settings.name == '/plant') {
          return MaterialPageRoute(builder: (context) => PlantPage());
        }
        if (settings.name == '/plantcare') {
          return MaterialPageRoute(builder: (context) => PlantCarePage());
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
