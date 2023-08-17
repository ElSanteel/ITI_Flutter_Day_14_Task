import 'package:flutter/material.dart';

import 'colors.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/images/light-background-log-in.png"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/orange-carrot.png"),
                    ],
                  ),
                  const Positioned(
                    left: 20,
                    top: 250,
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildPaddingAndText(
                greyedText: "Enter your emails and password",
              ),
              const SizedBox(height: 30),
              _buildTextField(
                labelText: "Email",
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  } else if (!isValidEmail(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildPasswordField(),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(children: [
                  Spacer(),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap:
                    _handleLogin, // Handle login logic when the button is tapped
                child: Container(
                  width: 300,
                  height: 50,
                  padding: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Log in",
                    style: TextStyle(color: Color(0xffFFF9FF), fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xff181725)),
                  ),
                  Text(
                    "Sign up",
                    style: TextStyle(color: color1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Padding _buildPaddingAndText({required String greyedText}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            greyedText,
            style: const TextStyle(fontSize: 15, color: Color(0xff7C7C7C)),
          ),
        ],
      ),
    );
  }

  Padding _buildTextField({
    required String labelText,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 15, color: Color(0xff7C7C7C)),
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Password",
            style: TextStyle(fontSize: 15, color: Color(0xff7C7C7C)),
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your password";
              } else if (value.length < 6) {
                return "Password must be at least 6 characters long";
              }
              return null;
            },
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleLogin() {
    // Simulate login with hardcoded credentials for demonstration
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email == "test@example.com" && password == "password") {
      // Login successful, show success message
      _showMessage("Login Successful!", Colors.green);
    } else {
      // Login failed, show error message
      _showMessage("Invalid Credentials. Please try again.", Colors.red);
    }
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
