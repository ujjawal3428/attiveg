import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
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
                padding: const EdgeInsets.only(
                  left: 20,
                ),
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
              const SizedBox(
                width: 18,
              ),
              Text(
                'Add Address',
                style: TextStyle(
                    color: Colors.pink.shade600,
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 25),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name Input
            Text('Name*',
                style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type here',
                ),
              ),
            ),
            SizedBox(height: 16),

            // Phone Number Input
            Text('Phone Number*',
                style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type here',
                ),
              ),
            ),
            SizedBox(height: 16),

            // Pin Code Input
            Text('Pin Code*',
                style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type here',
                ),
              ),
            ),
            SizedBox(height: 16),

            // Pin Code Input
            Text('Building, Company, Apartment*',
                style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type here',
                ),
              ),
            ),
            SizedBox(height: 16),

            // Pin Code Input
            Text('Area, Street, Sector',
                style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your pin code',
                ),
              ),
            ),
            SizedBox(height: 16),

            // Address Type
            Text('Address Type',
                style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 25,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('Home',
                      style: TextStyle(
                          fontFamily: 'DMSerifDisplay',
                          color: const Color.fromARGB(255, 255, 100, 100),
                          fontSize: 10)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 25,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Office',
                    style: TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        color: Colors.white,
                        fontSize: 10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 25,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('Other',
                      style: TextStyle(
                          fontFamily: 'DMSerifDisplay',
                          color: Colors.white,
                          fontSize: 10)),
                ),
              ],
            ),
            Container(
              width: 400,

              margin: const EdgeInsets.all(
                  16.0), // Optional margin around the container
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, // Background color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Action when the button is pressed
                },
                child: const Text(
                  'Save Address', // Button text
                  style: TextStyle(
                      fontFamily: 'DMSerifDisplay', fontSize: 16), // Text style
                ),
              ),
            )
          ],
        ),
      )
    ])));
  }
}
