import 'package:flutter/material.dart';

import 'colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/images/onboarding.png",
          width: 400,
          fit: BoxFit.cover, // This will make the image fill the entire screen
        ),
        Container(
          margin: const EdgeInsets.only(top: 430),
          child: Center(
              child: Column(
            children: [
              Image.asset('assets/images/minilogo.png'),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "to our store",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Get your groceries in as fast as one hour",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 353,
                height: 67,
                decoration: BoxDecoration(
                    color: color1, borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Text(
                  "Get Started",
                  style: TextStyle(color: Color(0xFFFFF9FF)),
                )),
              )
            ],
          )),
        )
      ],
    ));
  }
}
