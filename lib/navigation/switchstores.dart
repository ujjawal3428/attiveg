import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchStoresBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Divider with blink effect
              GestureDetector(
                onTap: () {
                  Get.snackbar('Divider Tapped !', '');
                },
                child: AnimatedContainer(
                  width: 80,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: const SizedBox.expand(),
                ),
              ),
              const SizedBox(height: 16),

              // Select Your Store text with dividers
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Select Your Store',
                    style: TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        color: Colors.pink,
                        fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 100,
                    height: 1,
                    color: Colors.black,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Container 1
              GestureDetector(
                onTap: () {
                  // Add your action here
                  Get.snackbar('Toy Store Selected', '');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/toy@2x.png',
                    width: 355,
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Container 2
              GestureDetector(
                onTap: () {
                  // Add your action here
                  Get.snackbar('Cosmetic Store Selected', '');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/cosmeticstore@2x.png',
                    width: 355,
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showBottomSheet(BuildContext context) {}
}
