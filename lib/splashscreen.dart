import 'package:flutter/material.dart';
import 'colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay navigation to the OnBoarding screen by 2 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });

    return Scaffold(
      backgroundColor: color1,
      body: Center(child: Image.asset("assets/images/logo.png")),
    );
  }
}
