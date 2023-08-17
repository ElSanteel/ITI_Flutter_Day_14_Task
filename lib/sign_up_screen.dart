import 'package:flutter/material.dart';

import 'colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleSignUp() {
    // You can implement your validation logic here.
    // For example, you can check if the form is valid and then process the signup.
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      // Perform your signup logic here...
      print(
          'Signing up with Username: $username, Email: $email, Password: $password');
    }
  }

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
                    top: 240,
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildPaddingAndText(
                greyedText: "Enter your credentials to continue",
              ),
              const SizedBox(height: 30),
              _buildTextField(
                labelText: "Username",
                controller: _usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your username";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "By Continuing you agree to our ",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text(
                      "Terms of Service",
                      style: TextStyle(color: color1),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text("and ",
                        style: TextStyle(fontSize: 13, color: Colors.grey)),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 14, color: color1),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: _handleSignUp,
                child: Container(
                  width: 300,
                  height: 50,
                  padding: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Sign Up",
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
                    "Already have an account? ",
                    style: TextStyle(color: Color(0xff181725)),
                  ),
                  Text(
                    "Sign in",
                    style: TextStyle(color: color1),
                  ),
                ],
              )
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
                    _obscurePassword ? Icons.visibility_off : Icons.visibility),
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
}
