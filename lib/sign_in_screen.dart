import 'package:flutter/material.dart';

import 'colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        "assets/images/light-background-log-in.png",
        width: 400,
        height: 283,
      ),
      Column(children: [
        Image.asset("assets/images/sign-in-pic.png", width: 413, height: 355),
        const Row(
          children: [
            Text(
              "     Get your groceries",
              style: TextStyle(
                  fontSize: 28,
                  color: Color(0xff030303),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Row(
          children: [
            Text("     with nectar",
                style: TextStyle(
                    fontSize: 28,
                    color: Color(0xff030303),
                    fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          width: 320,
          height: 70,
          margin: const EdgeInsets.only(left: 40, right: 20),
          decoration: BoxDecoration(
              color: color1, borderRadius: BorderRadius.circular(20)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Log in",
                style: TextStyle(color: Color(0xffFCFCFC), fontSize: 20),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Or connect with social media",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        _buildContainer(
            backGroundColor: const Color(0xff5383EC),
            imagePath: "assets/images/google-logo.png",
            containerText: "Continue with Google"),
        const SizedBox(height: 20),
        _buildContainer(
            backGroundColor: const Color(0xff4A66AC),
            imagePath: "assets/images/facebook-logo.png",
            containerText: "Continue with Facebook")
      ]),
    ]));
  }

  Container _buildContainer(
      {required Color backGroundColor,
      String? imagePath,
      required String containerText}) {
    return Container(
        width: 320,
        height: 70,
        margin: const EdgeInsets.only(left: 40, right: 20),
        padding: const EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
            color: backGroundColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Image.asset(imagePath!),
            const SizedBox(width: 30),
            Text(
              containerText,
              style: const TextStyle(color: Color(0xffFCFCFC), fontSize: 18),
            )
          ],
        ));
  }
}
