import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  final String title;
  final String categories;
  const ProductPage({super.key, required this.title, required this.categories});

  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  int currentPage = 1;
  int totalItems = 0;
  int itemsPerPage = 12; // Adjust as per API
  List<dynamic> items = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchItems(currentPage);
  }

  Future<void> fetchItems(int page) async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(
        'https://attiveg.com:8443/api/products?category=${widget.categories}&page=$page&size=$itemsPerPage'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        totalItems = data['totalItems'];
        items = data['data'];
        currentPage = page;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load items')),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = (totalItems / itemsPerPage).ceil();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Grid View
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 300),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Image.network(
                                  item['images'][0]['small'],
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 200,
                                        child: Text(
                                          item['name'],
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "₹${item['newPrice']}",
                                      style: TextStyle(color: Colors.pink),
                                    ),
                                    Text(
                                      "₹${item['oldPrice']}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        decorationColor: Colors.grey,
                                        decorationThickness: 1,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const Divider(),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Add to Cart',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Pagination Controls
                Center(
                  child: SizedBox(
                    width: 290,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(totalPages, (index) {
                          final page = index + 1;
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: page == currentPage
                                    ? Colors.blue
                                    : Colors.transparent,
                              ),
                              onPressed: () {
                                if (page != currentPage) {
                                  fetchItems(page);
                                }
                              },
                              child: Text(
                                '$page',
                                style: TextStyle(
                                    color: page == currentPage
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
