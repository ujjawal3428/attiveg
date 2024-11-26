import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    offset: const Offset(0, 7),
                    blurRadius: 10,
                    spreadRadius: 10,
                  ),
                ],
                color: Colors.grey,
                image: const DecorationImage(
                  image: AssetImage('assets/bg1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          'assets/back.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Text(
                      'Profile Info',
                      style: TextStyle(
                        color: Colors.pink.shade600,
                        fontFamily: 'DMSerifDisplay',
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name Label and Text Field
                  Text('Name *',
                      style: TextStyle(
                          fontFamily: 'DMSerifDisplay', fontSize: 16)),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                      hintText: 'Type Here',
                    ),
                  ),
                  SizedBox(height: 16), // Spacer

                  // Phone Number Label and Text Field
                  Text('Phone Number *',
                      style: TextStyle(
                          fontFamily: 'DMSerifDisplay', fontSize: 16)),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                      hintText: 'Type Here',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 30),
                  // Spacer

                  // Save Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Save button action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink, // Background color
                        foregroundColor: Colors.white, // Text color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'DMSerifDisplay',
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
    );
  }
}
