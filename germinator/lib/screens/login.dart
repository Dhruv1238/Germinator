import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 400),
              padding: const EdgeInsets.all(10),
              child: Image.network(
                'https://i.ibb.co/bLC56gz/germinator-Splash.png', // Replace with the URL of your plant image
                width: 200,
                height: 200,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 150),
              child: ElevatedButton(
                onPressed: () async {
                  print(emailController.text);
                  print(passwordController.text);
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                    Navigator.pushNamed(context, '/plant');
                  } on FirebaseAuthException catch (e) {
                    // Handle specific error codes and set error message
                    if (e.code == 'invalid-email') {
                      errorMessage = 'Invalid email address';
                    } else if (e.code == 'invalid-login-credentials') {
                      errorMessage = 'Wrong password';
                    } else {
                      errorMessage = 'An error occurred. Please try again.';
                    }

                    // Update the UI with the error message
                    setState(() {});
                  }
                },
                child: Text('Login'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(fontSize: 20),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: const EdgeInsets.only(bottom: 775),
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
