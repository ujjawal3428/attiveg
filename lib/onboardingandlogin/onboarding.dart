import 'package:flutter/material.dart';
import 'package:homepage/onboardingandlogin/loginpage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/onboarding.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),

          // Top shadow
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Bottom shadow
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/attiveg2.png',
                height: 40.0,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 385),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(text: 'Find the right skin\n'),
                      TextSpan(text: 'care products to\n'),
                      TextSpan(text: 'glow your skin'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 35,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Background color
                    foregroundColor: Colors.white, // Text color
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text("Get Started",
                      style: TextStyle(
                          fontFamily: 'DMSerifDisplay', fontSize: 20)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
