import 'package:flutter/material.dart';
import 'package:homepage/navigation/categories.dart';
import 'package:homepage/navigation/offer.dart';
import 'package:homepage/navigation/profile.dart';
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/navigation/switchstores.dart';
import 'package:homepage/notification.dart';
import 'package:homepage/search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<dynamic> categories = [];
  bool isLoading = true;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final url = Uri.parse('https://attiveg.com:8443/api/products/categories');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          categories = data['data'];
          isLoading = false;
        });
      } else {
        print('Failed to fetch categories: ${response.statusCode}');
        setState(() => isLoading = false);
      }
    } catch (e) {
      print('Error fetching categories: $e');
      setState(() => isLoading = false);
    }
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);

    final routes = {
      1: () => const HomePage(),
      2: () => const OfferPage(),
      3: () => const CategoriesPage(),
      4: () => const ProfilePage(),
    };

    if (routes.containsKey(index)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => routes[index]!()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              SizedBox(
                height: 106,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bg1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 28, top: 12, bottom: 15),
                          child: Center(
                            child: Image.asset(
                              'assets/Attiveg@2x.png',
                              width: 120,
                              height: 50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchPage()),
                                  );
                                },
                                child: Icon(Icons.search, color: Colors.black),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationPage(),
                                    ),
                                  );
                                },
                                child: Icon(Icons.notifications,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Categories Section
              SizedBox(
                height: 159,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          'assets/bg2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 111,
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(8.0),
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  final category = categories[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryDetailsPage(
                                            categoryId: category['id'],
                                            categoryName: category['name'],
                                            categoryImage: category['image'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: _buildCategoryCard(
                                      imageUrl: category['image'] ?? '',
                                      name: category['name'] ?? '',
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),
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
      ),
    );
  }

  Widget _buildCategoryCard({required String imageUrl, required String name}) {
    return Container(
      width: 111,
      height: 159,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 30,
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
              child: Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDetailsPage extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final String categoryImage;

  const CategoryDetailsPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Column(
        children: [
          Image.network(categoryImage),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Details for $categoryName",
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
