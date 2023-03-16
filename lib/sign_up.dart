import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_application/home_screen.dart';
import 'package:signup_application/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF495867),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Sign Up",
        ),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Hello there",
              style: TextStyle(
                color: Color(0xFF495867),
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 60),
            MyTextfield(
              title: "Name",
              controller: _nameController,
            ),
            const SizedBox(height: 15),
            MyTextfield(
              title: "Phone Number",
              controller: _phoneNumberController,
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            MyTextfield(
              title: "Email",
              controller: _emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            MyTextfield(
              title: "Password",
              controller: _passwordController,
              textInputType: TextInputType.visiblePassword,
              obscure: true,
            ),
            const SizedBox(height: 25),
            ClipRRect(
              borderRadius: AppTheme.cardRadius,
              child: InkWell(
                onTap: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  )
                      .then((value) {
                    print("login");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF495867),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.10, 0.10),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  height: 45,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
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
  final String title;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscure;
  const MyTextfield({
    Key? key,
    required this.title,
    required this.controller,
    this.textInputType = TextInputType.name,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(25),
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
        obscureText: obscure,
        keyboardType: textInputType,
        // ? TextInputType.visiblePassword
        // : TextInputType.emailAddress,
      ),
    );
  }
}
