import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/product/productpage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ViewAll extends StatefulWidget {
  final String title;

  const ViewAll({super.key, required this.title});

  @override
  ViewAllState createState() => ViewAllState();
}

class ViewAllState extends State<ViewAll> {
  int currentPage = 1;
  int totalItems = 0;
  int itemsPerPage = 10;
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
        'https://attiveg.com:8443/api/products?page=$page&size=$itemsPerPage'));
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
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 175,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ProductPage(id: item['id']));
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: SizedBox(
                                    height: 121,
                                    width: 130,
                                    child: Image.network(
                                      item['images'][0]['small'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, right: 40),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  item['name'],
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Row(
                                              children: [
                                                Text(
                                                  "₹${item['newPrice']}",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'DMSerifDisplay',
                                                    fontSize: 19,
                                                    color: Colors.pink,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "₹${item['oldPrice']}",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10.4,
                                                    decorationColor:
                                                        Colors.grey,
                                                    decorationThickness: 2,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Container(
                                                  height: 16,
                                                  width: 40,
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color: const Color.fromARGB(
                                                        255, 1, 104, 155),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${item['discount'].toInt()}% OFF',
                                                      style: TextStyle(
                                                        color: Colors.white,
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: Colors.pink.shade50,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 9,
                                                  color: Color.fromARGB(
                                                      255, 0, 145, 197),
                                                ),
                                                Text(
                                                  '${item['ratingsvalue'] ?? '0'}',
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
                                      : Colors.black,
                                ),
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
