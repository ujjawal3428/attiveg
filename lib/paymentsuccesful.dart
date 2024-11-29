import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          child: const Text('Show Cancel Order'),
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
            image: AssetImage('assets/your_background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Close Button (X icon) - Moved to top right
            Positioned(
              right: 16,
              top: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
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
                  // Added margin from top
                  const SizedBox(height: 70),
                  
                  // Savings Container
                  Container(
                    height: 87,
                    width: 236,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You have saved on this order',
                          style: TextStyle(color: Colors.green),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '₹ 234',
                          style: TextStyle(color: Colors.pink, fontSize: 20),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Confirmation Text
                  const Text(
                    'Do you really want to \ncancel your order?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Buttons Row - Moved further down
            Positioned(
              bottom: 10, // Reduced from 40 to move buttons further down
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle "Cancel My Order" action
                    },
                    child: const Text('Cancel My Order'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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

            // Bottom Right Image
            Positioned(
              bottom: 10, // Moved down to align with buttons
              right: 16,
              child: Container(
                width: 89,
                height: 89,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/your_image.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}