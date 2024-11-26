import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/homepage.dart';

import 'package:homepage/navigation/categories.dart';
import 'package:homepage/navigation/offer.dart';
import 'package:homepage/navigation/profile.dart';
import 'package:homepage/navigation/switchstores.dart';

class Ordertracker extends StatefulWidget {
  const Ordertracker({super.key});

  @override
  State<Ordertracker> createState() => _OrdertrackerState();
}

class _OrdertrackerState extends State<Ordertracker> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Get.off(() => const HomePage());
        break;
      case 2:
        Get.to(() => const OfferPage());
        break;
      case 3:
        Get.to(() => const CategoriesPage());
        break;
      case 4:
        Get.to(() => const ProfilePage());
        break;
    }
  }

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
                  'Order Tracker',
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
        SizedBox(
          height: 15,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text('Expected Delivery:',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'TOMORROW',
              style: TextStyle(
                fontSize: 32,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),

          // Three circle avatars with a pink divider
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // Background color
                          border: Border.all(color: Colors.pink)),
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/avatargift@4x.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    height: 1,
                    width: 150,
                    color: Colors.pink,
                  ),
                ),
                // Second Circle Avatar
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                      ),
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/avatarbike@4x.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    height: 1,
                    width: 150,
                    color: Colors.pink,
                  ),
                ),
                // Third Circle Avatar
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.pink)),
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/avatarcheck@4x.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final dashCount = (width / 10)
                    .floor(); // Adjust dash count based on available width

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(dashCount, (index) {
                    return Row(
                      children: [
                        Container(width: 5, height: 1, color: Colors.grey),
                        if (index < dashCount - 1)
                          SizedBox(width: 5), // Space between dashes
                      ],
                    );
                  }),
                );
              },
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Status:',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'On its Way',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Great news! You can almost unpack your \n orders.',
                style: TextStyle(fontSize: 18),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(height: 12),

          // Clickable container with image
          InkWell(
            onTap: () {
              // Define your onTap action here
            },
            child: Center(
              child: Flexible(
                child: Container(
                  height: 48,
                  width: 355,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/trackyourpackage@4x.png',
                        height: 48,
                        width: 355,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Tracking number text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
              child: Row(
                children: [
                  Text('Tracking number: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    'FY8247924294',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: 'FY8247924294'));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Copied to clipboard!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ]),
      ])),
      bottomNavigationBar: BottomNavigator(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        onSwitchStores: () {
          SwitchStoresBottomSheet.show(context);
        },
      ),
    );
  }
}
