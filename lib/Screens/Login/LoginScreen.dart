import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:virtual/Screens/translator.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController usernametextcontroller = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    usernametextcontroller.addListener(() {
      if (usernametextcontroller.text.length > 7) {
        usernametextcontroller.text = usernametextcontroller.text.substring(0, 7);
        usernametextcontroller.selection = TextSelection.fromPosition(
          TextPosition(offset: usernametextcontroller.text.length),
        );
      }
    });
  }

  @override
  void dispose() {
    usernametextcontroller.dispose();
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
                    height: 560,
                    width: 323,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white.withOpacity(0.0),
                    ),
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
                              _buildTextField(
                                label: 'Username',
                                controller: usernametextcontroller,
                                hint: 'Enter your username',
                                obscureText: false,
                              suffixIcon: IconButton(
                                  icon: Icon(
                                     Icons.star ,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    
                                  },
                                ),
                               ),

  //                             Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.only(top: 3.0, left: 10.0, right: 5.0),
  //       child: Text(
  //         "Username",
  //         style: TextStyle(
  //           fontFamily: 'Poppins',
  //           fontWeight: FontWeight.w300,
  //           fontSize: 14,
  //           color: Colors.black,
  //         ),
  //       ),
  //     ),
  //     Padding(
  //       padding: const EdgeInsets.only(top: 5, left: 10.0, right: 5.0),
  //       child: TextField(
  //         cursorColor: Colors.green,
  //         controller: usernametextcontroller,
  //         obscureText: false,
  //         decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
  //           isDense: true,  // This ensures the TextFields are the same size
  //           enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(14),
  //             borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(14),
  //             borderSide: const BorderSide(color: Colors.green),
  //           ),
  //           hintText: "Username",
  //           hintStyle: TextStyle(
  //             fontFamily: 'Poppins',
  //             fontWeight: FontWeight.w300,
  //             fontSize: 14,
  //             color: Colors.grey,
  //           ),
  //           suffixIcon:IconButton(
  //                                 icon: Icon(
  //                                   _obscureText ? Icons.visibility_off : Icons.visibility,
  //                                   color: Colors.green,
  //                                 ), onPressed: () {  },
  //         ),
  //         style: TextStyle(
  //           fontFamily: 'Poppins',
  //           fontWeight: FontWeight.w500,
  //           fontSize: 14,
  //           color: Colors.black,
  //         ),
  //       ),
  //     ),
  //   ],
  // ),
                              const SizedBox(height: 20), // Add spacing between fields
                              _buildTextField(
                                label: 'Password',
                                controller: passwordTextController,
                                hint: 'Enter your password',
                                obscureText: _obscureText,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility_off : Icons.visibility,
                                    color: Colors.green,
                                  ),
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
                                  onPressed: _handleLogin,
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white,
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
        ],
      ),
    );
  }

  void _handleLogin() {
    final username = usernametextcontroller.text.trim();
    final password = passwordTextController.text.trim();

    if (username.isEmpty && password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in both Username and Password")),
      );
    } else if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in the Username")),
      );
    } else if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in the Password")),
      );
    } else {
      // Navigate to TranslationScreen if inputs are valid
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TranslationScreen()),
      );
    }
  }}
Widget _buildTextField({
  required String label,
  required TextEditingController controller,
  required String hint,
  required bool obscureText,
  Widget? suffixIcon,
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
          cursorColor: Colors.green,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            isDense: true,  // This ensures the TextFields are the same size
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