import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signup_application/home_screen.dart';
import 'package:signup_application/sign_in.dart';
import 'package:signup_application/sign_up.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
    );
  }
}
