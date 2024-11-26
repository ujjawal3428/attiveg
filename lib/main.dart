import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/homepage.dart';
import './onboardingandlogin/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AttiVeg',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const OnboardingPage(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}
