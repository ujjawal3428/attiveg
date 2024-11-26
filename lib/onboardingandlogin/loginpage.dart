import 'package:flutter/material.dart';
import 'emaillogin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                width: size.width * 0.8, 
                'assets/makeupkit.png',
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    _buildButton(
                      context,
                      'assets/continuewithemailorcontact.png',
                      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Emaillogin())),
                    ),
                    SizedBox(height: size.height * 0.04),
                    _buildDivider(),
                    SizedBox(height: size.height * 0.04),
                    _buildButton(context, 'assets/continuewithgoogle.png', () {}),
                    SizedBox(height: size.height * 0.015),
                    _buildButton(context, 'assets/continuewithfacebook.png', () {}),
                    SizedBox(height: size.height * 0.015),
                    _buildButton(context, 'assets/continuewithapple.png', () {}),
                    SizedBox(height: size.height * 0.09),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Do not have an account? Sign up now',
                        style: TextStyle(
                           fontFamily: 'DMSerifDisplay',
                          color: Colors.pink, fontSize: isSmallScreen ? 10 : 12),
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

  Widget _buildButton(BuildContext context, String assetName, VoidCallback onTap) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        assetName,
        width: size.width * 0.8,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: Colors.black)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('or login with', style: TextStyle(
             fontFamily: 'DMSerifDisplay',
            color: Colors.black)),
        ),
        Expanded(child: Divider(thickness: 1, color: Colors.black)),
      ],
    );
  }
}