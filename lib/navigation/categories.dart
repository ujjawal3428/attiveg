import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/navigation/offer.dart';
import 'package:homepage/navigation/profile.dart';
import 'package:homepage/navigation/switchstores.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  CategoriesPageState createState() => CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesPage> {
  int _selectedIndex = 3;
  List categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    const String url = 'https://attiveg.com:8443/api/products/categories';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          categories = data['data'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error
      print(e);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Get.to(() => const HomePage());
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                            'Categories',
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
                  const SizedBox(height: 10),
                  ...categories.map((category) {
                    return InkWell(
                      onTap: () {
                        // Handle category tap
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 91,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(category['image']),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              height: 91,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.pink.shade400,
                                    Colors.pink.shade200.withOpacity(0),
                                  ],
                                  stops: [0.0, 0.5],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  category['name'],
                                  style: TextStyle(
                                    fontFamily: 'DMSerifDisplay',
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
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
