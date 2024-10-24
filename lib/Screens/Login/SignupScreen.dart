import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual/Screens/login/LoginScreen.dart'; // Import your LoginScreen here
import 'package:virtual/Screens/translator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    usernameTextController.addListener(() {
      if (usernameTextController.text.length > 7) {
        usernameTextController.text = usernameTextController.text.substring(0, 7);
        usernameTextController.selection = TextSelection.fromPosition(
          TextPosition(offset: usernameTextController.text.length),
        );
      }
    });

    phoneTextController.addListener(() {
      if (phoneTextController.text.length > 10) {
        phoneTextController.text = phoneTextController.text.substring(0, 10);
        phoneTextController.selection = TextSelection.fromPosition(
          TextPosition(offset: phoneTextController.text.length),
        );
      }
    });
  }

  @override
  void dispose() {
    nameTextController.dispose();
    phoneTextController.dispose();
    usernameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -3,
            left: 0,
            height: 165,
            width: 230,
            child: Image.asset(
              "assets/Page_Assets/loginpage_bananna_leaf_1.png",
              scale: 4,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/Page_Assets/loginpage_bananna_leaf_2.png",
              scale: 4,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: Container(
                    height: 650,
                    width: 323,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white.withOpacity(0.0),
                    ),
                    child: SingleChildScrollView( // Allow scrolling when keyboard appears
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    "SignUp Page",
                                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500, color: Colors.black),
                                  ),
                                ),
                                SizedBox(height: 40),
                                _buildTextField(
                                  label: 'Name',
                                  controller: nameTextController,
                                  hint: 'Enter your name',
                                  obscureText: false,
                                  inputFormatters: [VarcharTextInputFormatter()],
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.star, color: Colors.green),
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(height: 20),
                                _buildTextField(
                                  label: 'Phone Number',
                                  controller: phoneTextController,
                                  hint: 'Enter your phone number',
                                  obscureText: false,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  key:TextInputType.number,
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.star, color: Colors.green),
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(height: 20),
                                _buildTextField(
                                  label: 'Username',
                                  controller: usernameTextController,
                                  hint: 'Enter your username',
                                  obscureText: false,
                                  inputFormatters: [VarcharTextInputFormatter()],
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.star, color: Colors.green),
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(height: 20),
                                _buildTextField(
                                  label: 'Password',
                                  controller: passwordTextController,
                                  hint: 'Enter your password',
                                  obscureText: _obscureText,
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.green),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    onPressed: _handleSignup,
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Loginscreen()),
                                      );
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                        children: [
                                          TextSpan(text: 'Already have an account? '),
                                          TextSpan(
                                            text: 'Login',
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Loginscreen()),
                                                );
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSignup() {
    final name = nameTextController.text.trim();
    final phone = phoneTextController.text.trim();
    final username = usernameTextController.text.trim();
    final password = passwordTextController.text.trim();

    if (name.isEmpty || phone.isEmpty || username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
    } else {
      // Navigate to TranslationScreen if inputs are valid
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TranslationScreen()),
      );
    }
  }
}

Widget _buildTextField({
  required String label,
  required TextEditingController controller,
  required String hint,
  required bool obscureText,
  Widget? suffixIcon,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? key,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 3.0, left: 10.0, right: 5.0),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 2.5, left: 10.0, right: 5.0),
        child: TextField(
          keyboardType:key,
          cursorColor: Colors.green,
          controller: controller,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.green),
            ),
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              fontSize: 14,
              color: Colors.grey,
            ),
            suffixIcon: suffixIcon,
          ),
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}

class VarcharTextInputFormatter extends TextInputFormatter {
  static final _varcharRegex = RegExp(r'^[\w\s\.]*$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_varcharRegex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
