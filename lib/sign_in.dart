import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_application/home_screen.dart';
import 'package:signup_application/sign_up.dart';
import 'package:signup_application/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.cardPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                color: Color(0xFF495867),
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 60),
            MyTextfield(
              controller: _emailController,
              title: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            MyTextfield(
              controller: _passwordController,
              title: "Password",
              textInputType: TextInputType.visiblePassword,
              isObscure: true,
            ),
            const SizedBox(height: 25),
            ClipRRect(
              borderRadius: AppTheme.cardRadius,
              child: InkWell(
                onTap: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((value) {
                    print("Sign in");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  color: const Color(0xFF495867),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignUp();
                }));
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Color(0xFF495867),
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputType textInputType;
  final bool isObscure;
  const MyTextfield({
    Key? key,
    required this.title,
    required this.controller,
    this.textInputType = TextInputType.name,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      elevation: 4,
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 13),
        decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(fontSize: 13),
          fillColor: AppColors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Color(0xFFDFE6ED), width: 0.8),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Color(0xFFDFE6ED), width: 0.8),
          ),
        ),
        obscureText: isObscure,
        keyboardType: textInputType,
      ),
    );
  }
}
