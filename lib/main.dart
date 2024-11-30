import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/homepage.dart';
import './onboardingandlogin/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checklogin();
  }

  String? token;

  Future<void> checklogin() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AttiVeg',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: token == null ? const OnboardingPage() : const HomePage(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}
