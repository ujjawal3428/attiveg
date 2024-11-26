import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/onboardingandlogin/emaillogin.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Signup> {
  // Text Controllers for form fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // GlobalKey for Form
  final _formKey = GlobalKey<FormState>();

  // Function to send POST request
  Future<void> createAccount() async {
    if (!_formKey.currentState!.validate()) {
      // If form validation fails, do not proceed
      return;
    }

    final String url =
        "https://example.com/api/register"; // Replace with your API endpoint
    final Map<String, String> payload = {
      "fullName": fullNameController.text,
      "email": emailController.text,
      "number": numberController.text,
      "password": passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload),
      );

      if (response.statusCode == 201) {
        // Success: Navigate to HomePage
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        // Failure: Show error message
        final error =
            jsonDecode(response.body)['message'] ?? 'Failed to create account';
        _showErrorDialog(error);
      }
    } catch (e) {
      _showErrorDialog('An error occurred. Please try again.');
    }
  }

  // Function to show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
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
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.17,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/attiveg2.png',
                        width: size.width * 0.3,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: size.height * 0.03),
                      _buildTextField(
                        'Full Name',
                        controller: fullNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Full Name is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.02),
                      _buildTextField(
                        'Email',
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.02),
                      _buildTextField(
                        'Number',
                        controller: numberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone Number is required';
                          }
                          if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            return 'Enter a valid 10-digit phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.02),
                      _buildTextField(
                        'Password',
                        controller: passwordController,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.02),
                      _buildTextField(
                        'Rewrite Password',
                        controller: confirmPasswordController,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      SizedBox(
                        height: 56,
                        width: 342,
                        child: ElevatedButton(
                          onPressed: createAccount,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                          ),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              fontFamily: 'DMSerifDisplay',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Emaillogin()),
                          );
                        },
                        child: Text(
                          "Already have an account? Sign in now",
                          style: TextStyle(
                            fontFamily: 'DMSerifDisplay',
                            color: Colors.pink,
                            fontSize: isSmallScreen ? 16 : 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return Container(
      height: 56,
      width: 342,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: validator,
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
