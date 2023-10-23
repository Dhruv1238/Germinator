import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Germinator',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Germinator'),
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Text('Hello World'),
          ),
        ));
  }
}
