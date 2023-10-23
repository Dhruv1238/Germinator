import 'package:flutter/material.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Germinator'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
