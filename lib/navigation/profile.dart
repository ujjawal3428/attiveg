import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/helpandfaqs.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/logout.dart';

import 'package:homepage/manageaddress.dart';
import 'package:homepage/myorder.dart';
import 'package:homepage/navigation/categories.dart';
import 'package:homepage/navigation/offer.dart';
import 'package:homepage/navigation/profileinfo.dart';
import 'package:homepage/navigation/switchstores.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                      Get.to(() => const HomePage());
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
                  'My Profile',
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
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Container(
            width: 450,
            height: 171,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hello, Sir!',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.pink,
                            fontFamily: 'DMSerifDisplay',
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '👋',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.pink,
                        ),
                        onPressed: () {
                          Get.to(() => const ProfileInfo());
                        },
                        child: Text('Edit'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Email Container
                Container(
                  height: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/profilemail@2x.png', // Replace with your email icon path
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 10),
                      Text('test@gmail.com'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // Phone Container
                Container(
                  height: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/profilecall@2x.png', // Replace with your phone icon path
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(width: 10),
                      Text('+91 890-456-7890'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 450,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/rupees@2x.png', // Replace with your left image path
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Orders',
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                  ),
                ),
                Flexible(
                    child: SizedBox(
                  width: 292,
                )),
                InkWell(
                  onTap: () {
                    Get.to(() => const MyOrders());
                  },
                  child: Image.asset(
                    'assets/upright@2x.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 450,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/profilehelp@2x.png', // Replace with your left image path
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Help&FAQs',
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                  ),
                ),
                Flexible(
                    child: SizedBox(
                  width: 265,
                )),
                InkWell(
                  onTap: () {
                    Get.to(() => const Helpandfaqs());
                  },
                  child: Image.asset(
                    'assets/upright@2x.png', // Replace with your right image path
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 450,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/profilelocation@2x.png', // Replace with your left image path
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Manage Address',
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                  ),
                ),
                Flexible(
                    child: SizedBox(
                  width: 229,
                )),
                InkWell(
                  onTap: () {
                    Get.to(() => const ManageAddress());
                  },
                  child: Image.asset(
                    'assets/upright@2x.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 450,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/logout@2x.png',
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                  ),
                ),
                Flexible(
                    child: SizedBox(
                  width: 285,
                )),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) =>
                          const CancelOrderDialog(),
                    );
                  },
                  child: Image.asset(
                    'assets/upright@2x.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
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
