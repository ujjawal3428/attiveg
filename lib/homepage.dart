import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homepage/cart.dart';
import 'package:homepage/navigation/categories.dart';
import 'package:homepage/navigation/offer.dart';
import 'package:homepage/navigation/profile.dart';
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/navigation/switchstores.dart';
import 'package:homepage/notification.dart';
import 'package:homepage/product/products_search_page.dart';
import 'package:homepage/search.dart';
import 'package:homepage/widgets_homepage/cetaphil.dart';
import 'package:homepage/widgets_homepage/copynewarrival.dart';
import 'package:homepage/widgets_homepage/featured.dart';
import 'package:homepage/widgets_homepage/lovedbrands.dart';
import 'package:homepage/widgets_homepage/newarrival.dart';
import 'package:homepage/widgets_homepage/on_sale.dart';
import 'package:homepage/widgets_homepage/top_rated.dart';
import 'package:homepage/widgets_homepage/topbrands.dart';
import 'package:homepage/wishlist.dart';
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
      Get.off(() => routes[index]!());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const SearchPage());
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: HexColor('#DD3877'),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: ImageIcon(
                                      AssetImage('assets/search.png'),
                                      color: HexColor('#DD3877'),
                                      size: 25,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 7),
                                GestureDetector(
                                    onTap: () {
                                      Get.to(() => const NotificationPage());
                                    },
                                    child: ImageIcon(
                                      AssetImage('assets/bell.png'),
                                      color: HexColor('#DD3877'),
                                      size: 25,
                                    )),
                                const SizedBox(width: 7),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const WishlistPage());
                                  },
                                  child: ImageIcon(
                                    AssetImage('assets/heart.png'),
                                    color: HexColor('#DD3877'),
                                    size: 25,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const CartPage());
                                  },
                                  child: ImageIcon(
                                    AssetImage('assets/cart.png'),
                                    color: HexColor('#DD3877'),
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
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
                                      Get.to(
                                        () => ProductSearchPage(
                                            title: category['name'] ?? '',
                                            categories: category['slug'] ?? ''),
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

              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 26.0, bottom: 8.0),
                child: Text('Top Brands',
                    style: const TextStyle(
                      fontFamily: 'DMSerifDisplay',
                      color: Color.fromARGB(255, 195, 18, 127),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              TopBrandsSection(),
              NewArrivalsSection(),
              FeaturedSection(),
              OnSaleSection(),
              TopRatedSection(),
              LovedBrandsSection(),
              CopyNewArrivalSection(),
              CetaphilSection(),
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
