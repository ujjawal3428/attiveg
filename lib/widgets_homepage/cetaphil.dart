import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CetaphilSection extends StatefulWidget {
  const CetaphilSection({super.key});

  @override
  CetaphilSectionState createState() => CetaphilSectionState();
}

class CetaphilSectionState extends State<CetaphilSection> {
  List<dynamic> _sections = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSections();
  }

  Future<void> _fetchSections() async {
    const String apiUrl = 'https://attiveg.com:8443/api/sections';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          _sections = data['data'];
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load sections');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      debugPrint('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var section in _sections) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0, bottom: 8.0),
                    child: Text(
                      section['title'],
                      style: const TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        color: Color.fromARGB(255, 195, 18, 127),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 356,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(8.0),
                      itemCount: section['records'].length,
                      itemBuilder: (context, index) {
                        final record = section['records'][index];
                        return _buildPromotionalSection(
                            record['image'], record['url']);
                      },
                    ),
                  ),
                ],
              ],
            ),
    );
  }

  Widget _buildPromotionalSection(String imageUrl, String url) {
    return Container(
      width: 356,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                    child:
                        Icon(Icons.broken_image, size: 50, color: Colors.grey));
              },
            ),
          ),
          Positioned(
            bottom: 15,
            left: 20,
            child: ElevatedButton(
              onPressed: () {
                // Handle navigation to URL
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
                border: Border.all(color: Colors.white, width: 0),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.pink),
                onPressed: () {
                  // Handle navigation to URL
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
