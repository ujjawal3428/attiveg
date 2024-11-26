import 'package:flutter/material.dart';
import 'package:homepage/homepage.dart';

import 'package:homepage/onboardingandlogin/signup.dart';

class Emaillogin extends StatelessWidget {
  const Emaillogin({super.key});

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
                    _buildTextField(context, 'Email or Number'),
                    SizedBox(height: size.height * 0.02),
                    _buildTextField(context, 'Password', isPassword: true),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        ),
                        child: const Text('Log In',style: TextStyle( fontFamily: 'DMSerifDisplay',),),
                      ),
                    ),
                    SizedBox(height: size.height * 0.09),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Signup()),
                        );
                      },
                      child: Text(
                        "Don't have an account? Sign up now",
                        style: TextStyle(
                           fontFamily: 'DMSerifDisplay',
                          color: Colors.pink, fontSize: isSmallScreen ? 16 : 20),
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

  Widget _buildTextField(BuildContext context, String label, {bool isPassword = false}) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 56,
      width: size.width * 0.8,
      child: TextField(
        obscureText: isPassword,
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