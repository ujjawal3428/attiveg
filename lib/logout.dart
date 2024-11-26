import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) => const CancelOrderDialog(),
            );
          },
          child: const Text(
            'Show Cancel Order',
            style: TextStyle(
              fontFamily: 'DMSerifDisplay',
            ),
          ),
        ),
      ),
    );
  }
}

class CancelOrderDialog extends StatelessWidget {
  const CancelOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage('assets/gradient@4x.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Close Button (X icon)
            Positioned(
              right: 16,
              top: 20,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close),
              ),
            ),

            // Main Content Column
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Image.asset(
                    'assets/logoutgirl@4x.png',
                    width: 140,
                    height: 174,
                  ),

                  const SizedBox(height: 10),

                  // Confirmation Text
                  const Text(
                    'Do you really want to \n Logout?',
                    style: TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Buttons Row
            Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle "Logout" action
                    },
                    child: const Text('Logout'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade200,
                      foregroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Go Back'),
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
