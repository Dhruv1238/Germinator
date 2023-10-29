import 'package:flutter/material.dart';
import 'package:germinator/screens/landing.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Germinator",
      home: Landing(),
      debugShowCheckedModeBanner: false,
    );
  }
}
