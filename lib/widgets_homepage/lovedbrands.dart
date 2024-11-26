import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LovedBrandsSection extends StatefulWidget {
  // Add brands as a parameter
  const LovedBrandsSection({super.key});

  @override
  State<LovedBrandsSection> createState() => _LovedBrandsSectionState();
}

class _LovedBrandsSectionState extends State<LovedBrandsSection> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  List<dynamic> brands = [];
  bool isLoading = true;
  List<String> images = [];

  Future<void> fetchData() async {
    const String url =
        'https://attiveg.com:8443/api/products/brands'; // Replace with your API URL
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Total Items: ${data['totalItems']}');
        print('Data: ${data['data']}');
        setState(() {
          images = (data['data'] as List)
              .map((item) => item['image'] as String)
              .toList();
          isLoading = false;
        });
        // Use the fetched data as required
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Loved Brands',
                        style: TextStyle(
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 28,
                          color: Color.fromARGB(187, 213, 139, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset(
                          'assets/star.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    child: const Text('View All'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  final brand = images[index];
                  return Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 0.5),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(brand),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
