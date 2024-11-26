import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/homepage.dart';

import 'package:homepage/navigation/categories.dart';
import 'package:homepage/navigation/offer.dart';
import 'package:homepage/navigation/profile.dart';
import 'package:homepage/navigation/switchstores.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Use pushReplacement to maintain state and index
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 5),
                      blurRadius: 0.5,
                      spreadRadius: 2,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
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
                      Flexible(
                        child: Container(
                          height: 38,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                offset: const Offset(0, 7),
                                blurRadius: 10,
                                spreadRadius: 10,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 9.0),
                              border: InputBorder.none,
                              hintText: 'Search Products Here',
                              prefixIcon:
                                  const Icon(Icons.search, color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _controller.clear();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading Container
                  Container(
                    margin: const EdgeInsets.only(left: 25.0, bottom: 20.0),
                    child: const Text(
                      'Trending Searches',
                      style: TextStyle(
                          color: Color.fromARGB(255, 229, 29, 95),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DMSerifDisplay'),
                    ),
                  ),
                  // Container holding 6 smaller containers
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSmallContainer('Container 1'),
                          _buildSmallContainer('Container 2'),
                          _buildSmallContainer('Container 3'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSmallContainer('Container 4'),
                          _buildSmallContainer('Container 5'),
                          _buildSmallContainer('Container 6'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              _buildSuggestedItems(),

              //more content here
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
      ),
    );
  }
}

// small containers layout
Widget _buildSmallContainer(String text) {
  return Container(
    width: 92,
    height: 38,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.pink,
          fontSize: 12,
        ),
      ),
    ),
  );
}

Widget _buildSuggestedItems() {
  return Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 16),
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(offset: Offset(0, 3), color: Colors.black)]),
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Suggested Items',
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 32,
                    // fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 215, 27, 90),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(color: Colors.pink.shade600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildProductCard(),
                _buildProductCard(),
                _buildProductCard(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildProductCard() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    width: 165,
    height: 250,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => {},
              child: Container(
                height: 180,
                width: 165,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/medicine.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      SizedBox(width: 2),
                      Text(
                        '4.5',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 2),
              child: Text(
                '250ml',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                width: 134,
                alignment: Alignment.topLeft,
                child: Row(children: [
                  const Text(
                    '₹999',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '₹1089.00',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'DMSerifDisplay',
                        fontSize: 7,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 1.5),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    height: 14, // Reduced from 16
                    width: 32, // Reduced from 38
                    padding: const EdgeInsets.all(1), // Reduced from 2
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4), // Reduced from 6
                      color: const Color.fromARGB(255, 1, 104, 155),
                    ),
                    child: const Center(
                      child: Text(
                        '7% OFF',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 6, // Reduced from 7
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8), // Reduced from 10
                  child: SizedBox(
                    height: 25, // Reduced from 35
                    width: 25, // Reduced from 35
                    child: GestureDetector(
                      onTap: () {
                        // Handle button tap here
                      },
                      child: Image.asset(
                        'assets/heartbutton@4x.png',
                        width: 24.0, // Reduced from 30
                        height: 24.0, // Reduced from 30
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    height: 50,
                    width: 109,
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/addtocartbutton.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 6, vertical: 3), // Reduced from 8,4
            decoration: const BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), // Reduced from 10
                bottomRight: Radius.circular(8), // Reduced from 10
              ),
            ),
            child: const Text(
              'New',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10, // Added smaller font size
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
