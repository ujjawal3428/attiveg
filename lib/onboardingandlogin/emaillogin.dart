import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/onboardingandlogin/signup.dart';

class Emaillogin extends StatefulWidget {
  const Emaillogin({super.key});

  @override
  State<Emaillogin> createState() => _EmailloginState();
}

class _EmailloginState extends State<Emaillogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers to free resources when the widget is removed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    final prefs = await SharedPreferences.getInstance();

    final String emailOrMobile = emailController.text.trim();
    final String password = passwordController.text.trim();

    // Determine if the input is a mobile number
    final bool isMobileNumber = RegExp(r'^\d{10}$').hasMatch(emailOrMobile);
    print(isMobileNumber);
    // Validate input
    if (emailOrMobile.isEmpty) {
      Get.snackbar(
        "Error",
        "Email/Mobile field cannot be empty.",
      );
      return;
    }

    if (isMobileNumber) {
      // Mobile number validation
      if (!RegExp(r'^\d{10}$').hasMatch(emailOrMobile)) {
        Get.snackbar(
          "Error",
          "Please enter a valid 10-digit mobile number.",
        );
        return;
      }
    } else {
      // Email and password validation
      if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(emailOrMobile)) {
        Get.snackbar(
          "Error",
          "Please enter a valid email address.",
        );
        return;
      }
      if (password.isEmpty) {
        Get.snackbar(
          "Error",
          "Password field cannot be empty.",
        );
        return;
      }
    }

    // Use different API endpoints based on input type
    final String apiUrl = isMobileNumber
        ? "https://attiveg.com:8443/api/login/send-otp" // API for mobile number login
        : "https://attiveg.com:8443/api/login/password"; // API for email and password login

    try {
      final Map<String, dynamic> requestBody = isMobileNumber
          ? {
              "username": emailOrMobile, // Only send the mobile number
            }
          : {
              "username": emailOrMobile, // Send email
              "password": password, // Send password
            };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Store token or any required data in shared preferences
        if (isMobileNumber == false) {
          prefs.setString('token', responseBody['token']);
        }

        // Navigate to HomePage
        Get.offAll(() => const HomePage());
        Get.snackbar(
          "Login Successful!",
          "",
        );
      } else {
        // Handle error response
        Get.snackbar(
          "Login Failed",
          "Invalid credentials or server error.",
        );
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar(
        "Error",
        "An error occurred: $e",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/gradient.png',
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/makeupkit.png',
                width: size.width * 0.8,
                fit: BoxFit.contain,
              ),
            ),
            SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.17,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/attiveg2.png',
                      width: size.width * 0.3,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Explore wide range of\nproducts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        fontSize: isSmallScreen ? 24 : 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    _buildTextField(
                        context, 'Email or Number', emailController),
                    SizedBox(height: size.height * 0.02),
                    _buildTextField(
                        context,
                        'Password',
                        isPassword: true,
                        passwordController),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Add your forgot password logic here
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontFamily: 'DMSerifDisplay',
                              color: Color.fromARGB(255, 255, 123, 123)),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    SizedBox(
                      width: size.width * 0.8,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          loginUser();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontFamily: 'DMSerifDisplay',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.09),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const Signup());
                      },
                      child: Text(
                        "Don't have an account? Sign up now",
                        style: TextStyle(
                            fontFamily: 'DMSerifDisplay',
                            color: Colors.pink,
                            fontSize: isSmallScreen ? 16 : 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      BuildContext context, String label, TextEditingController controller,
      {bool isPassword = false}) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 56,
      width: size.width * 0.8,
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
