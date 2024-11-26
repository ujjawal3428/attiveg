import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/homepage.dart';

import 'package:homepage/navigation/categories.dart';
import 'package:homepage/navigation/profile.dart';
import 'package:homepage/navigation/switchstores.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Use pushReplacement to maintain state and index
    switch (index) {
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
      backgroundColor: Colors.white,
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
                      'Offers',
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
              height: 10,
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 15,
                          right: 15,
                          bottom: 0,
                        ),
                        child: Container(
                          height: 134,
                          width: 351,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/coupan@4x.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 22,
                                top: 20,
                                child: Text(
                                  '20% OFF',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    fontSize: 31,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 22,
                                top: 75,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, \nconsectetur ',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.pink.shade300,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                top: 15,
                                child: InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Coupon copied!')),
                                    );
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 105,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/copy@4x.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 15,
                          right: 15,
                          bottom: 0,
                        ),
                        child: Container(
                          height: 134,
                          width: 351,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/coupan@4x.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 22,
                                top: 20,
                                child: Text(
                                  '20% OFF',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    fontSize: 31,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 22,
                                top: 75,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, \nconsectetur ',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.pink.shade300,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                top: 15,
                                child: InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Coupon copied!')),
                                    );
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 105,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/copy@4x.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 15,
                          right: 15,
                          bottom: 0,
                        ),
                        child: Container(
                          height: 134,
                          width: 351,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/coupan@4x.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 22,
                                top: 20,
                                child: Text(
                                  '20% OFF',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    fontSize: 31,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 22,
                                top: 75,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, \nconsectetur ',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.pink.shade300,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                top: 15,
                                child: InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Coupon copied!')),
                                    );
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 105,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/copy@4x.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 15,
                          right: 15,
                          bottom: 0,
                        ),
                        child: Container(
                          height: 134,
                          width: 351,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/coupan@4x.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 22,
                                top: 20,
                                child: Text(
                                  '20% OFF',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    fontSize: 31,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 22,
                                top: 75,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, \nconsectetur ',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.pink.shade300,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                top: 15,
                                child: InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Coupon copied!')),
                                    );
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 105,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/copy@4x.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 15,
                          right: 15,
                          bottom: 0,
                        ),
                        child: Container(
                          height: 134,
                          width: 351,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/coupan@4x.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 22,
                                top: 20,
                                child: Text(
                                  '20% OFF',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    fontSize: 31,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 22,
                                top: 75,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, \nconsectetur ',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.pink.shade300,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                top: 15,
                                child: InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Coupon copied!')),
                                    );
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 105,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/copy@4x.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
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
