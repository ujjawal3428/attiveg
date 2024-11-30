import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopBrandsSection extends StatefulWidget {
  const TopBrandsSection({super.key});

  @override
  TopBrandsSectionState createState() => TopBrandsSectionState();
}

class TopBrandsSectionState extends State<TopBrandsSection> {
  late Future<List<Record>> _topBrands;

  @override
  void initState() {
    super.initState();
    _topBrands = fetchTopBrands();
  }

  Future<List<Record>> fetchTopBrands() async {
    const url = 'https://attiveg.com:8443/api/sections';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final topBrandsSection = data['data']
          .firstWhere((section) => section['title'] == 'Top Brands');
      final records = topBrandsSection['records'] as List;
      return records.map((record) => Record.fromJson(record)).toList();
    } else {
      throw Exception('Failed to load top brands');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 356,
      child: FutureBuilder<List<Record>>(
        future: _topBrands,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No top brands available'));
          }

          final records = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return _buildPromotionalSection(record.image, record.url);
            },
          );
        },
      ),
    );
  }

  Widget _buildPromotionalSection(String imageUrl, String url) {
    return Container(
      width: 356,
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 0,bottom: 16),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 15,
            left: 20,
            child: ElevatedButton(
              onPressed: () {
                // Handle navigation or action for "Shop Now"
                launchUrl(url);
              },
              child: const Text(
                'Shop Now',
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.pink,
                ),
                onPressed: () {
                  // Handle navigation or action for the forward button
                  launchUrl(url);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void launchUrl(String url) {
    // Use a package like `url_launcher` to open the URL
    // For example:
    // launch(url);
  }
}

class Record {
  final int id;
  final String title;
  final String image;
  final String url;

  Record({
    required this.id,
    required this.title,
    required this.image,
    required this.url,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      url: json['url'],
    );
  }
}
