import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/product/productpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:homepage/navigation/categories.dart';
import 'package:homepage/navigation/offer.dart';
import 'package:homepage/navigation/profile.dart';
import 'package:homepage/navigation/switchstores.dart';
import 'package:homepage/widgets_homepage/featured.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 1;
  List<dynamic> _products = [];
  int currentPage = 1;
  int totalItems = 0;
  bool _isLoading = false;
  String currentQuery = '';
  Timer? _debounce;

  Future<void> fetchItems(String query, int page) async {
    if (_isLoading) return; // Avoid overlapping API calls
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http
          .get(Uri.parse('https://attiveg.com:8443/api/products?s=$query'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['data'] != null && data['data'] is List) {
          setState(() {
            totalItems = data['totalItems'] ?? 0;
            if (page == 1) {
              _products = List.from(data['data']); // Replace on a new search
            } else {
              _products
                  .addAll(List.from(data['data'])); // Append for pagination
            }
            currentPage = page;
          });
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load items: ${response.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching products: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final query = _controller.text.trim();
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        if (query != currentQuery) {
          currentQuery = query;
          fetchItems(query, 1); // Trigger search with new query
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

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
        appBar: AppBar(
          title: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Search Products Here',
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: _controller.clear,
              ),
            ),
          ),
        ),
        body: _isLoading && currentPage == 1
            ? Center(child: CircularProgressIndicator())
            : _products.isEmpty
                ? FeaturedSection()
                : _products.isEmpty && !_isLoading
                    ? Center(
                        child: Text(
                          'No products found.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : NotificationListener<ScrollNotification>(
                        onNotification: (scrollInfo) {
                          if (!_isLoading &&
                              scrollInfo.metrics.pixels ==
                                  scrollInfo.metrics.maxScrollExtent &&
                              _products.length < totalItems) {
                            fetchItems(currentQuery,
                                currentPage + 1); // Load next page
                            return true;
                          }
                          return false;
                        },
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 8,
                            mainAxisExtent: 175,
                          ),
                          itemCount: _products.length,
                          itemBuilder: (context, index) {
                            final item = _products[index];

                            // Use safe access for nested fields
                            final imageUrl = (item['images'] != null &&
                                    item['images'].isNotEmpty)
                                ? item['images'][0]['small']
                                : null;
                            final productName =
                                item['name'] ?? 'Unknown Product';
                            final newPrice = item['newPrice'] ?? '0';
                            final oldPrice = item['oldPrice'] ?? '0';
                            final discount = item['discount'] ?? 0;
                            final ratingsValue = item['ratingsvalue'] ?? '0';

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: GestureDetector(
                                onTap: () {
                                  if (item['id'] != null) {
                                    Get.to(() => ProductPage(id: item['id']));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Product details not available.')),
                                    );
                                  }
                                },
                                child: Card(
                                  color: Colors.white,
                                  elevation: 4,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: SizedBox(
                                          height: 121,
                                          width: 130,
                                          child: imageUrl != null
                                              ? Image.network(
                                                  imageUrl,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Icon(Icons.error);
                                                  },
                                                  fit: BoxFit.fill,
                                                )
                                              : Center(
                                                  child: Icon(
                                                      Icons.broken_image,
                                                      size: 50),
                                                ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 3),
                                          child: Stack(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20, right: 40),
                                                    child: Text(
                                                      productName,
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 2),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "₹$newPrice",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'DMSerifDisplay',
                                                          fontSize: 19,
                                                          color: Colors.pink,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "₹$oldPrice",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10.4,
                                                          decorationColor:
                                                              Colors.grey,
                                                          decorationThickness:
                                                              2,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      if (discount > 0)
                                                        Container(
                                                          height: 16,
                                                          width: 40,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            color: const Color
                                                                .fromARGB(255,
                                                                1, 104, 155),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '${discount.toInt()}% OFF',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'DMSerifDisplay',
                                                                fontSize: 7,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 5),
                                                  Image.asset(
                                                    'assets/addtocartbutton.png',
                                                    height: 33,
                                                    width: 166,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                top: 20,
                                                right: 20,
                                                child: Container(
                                                  height: 14,
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color: Colors.pink.shade50,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        size: 9,
                                                        color: Color.fromARGB(
                                                            255, 0, 145, 197),
                                                      ),
                                                      Text(
                                                        ratingsValue,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 145, 197),
                                                          fontSize: 8.4,
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
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
