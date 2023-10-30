import 'package:flutter/material.dart';
import 'package:germinator/screens/landing.dart';
import 'package:germinator/screens/login.dart';
import 'package:germinator/screens/plant2.dart';
import 'package:germinator/screens/signup.dart';
import 'package:germinator/screens/plant.dart';
import 'package:germinator/screens/plantinfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        if (settings.name == '/plant2') {
          return MaterialPageRoute(builder: (context) => PlantPage2());
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
