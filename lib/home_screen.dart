import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_application/sign_in.dart';
import 'package:signup_application/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF495867),
        centerTitle: true,
        title: const Text(
          "Home Page",
        ),
      ),
      backgroundColor: AppColors.white,
      body: Center(
        child: SizedBox(
          height: 40,
          width: 130,
          child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Sign out");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignIn();
                }));
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF495867),
            ),
            child: const Text(
              "Log out",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
