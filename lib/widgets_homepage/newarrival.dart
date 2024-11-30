import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/product/product_models.dart';
import 'package:http/http.dart' as http;
import 'package:homepage/product/productpage.dart';

class NewArrivalsSection extends StatefulWidget {
  const NewArrivalsSection({super.key});

  @override
  State<NewArrivalsSection> createState() => _NewArrivalsSectionState();
}

class _NewArrivalsSectionState extends State<NewArrivalsSection> {
  List<dynamic> items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(
        Uri.parse('https://attiveg.com:8443/api/products?type=new-arrivals'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        items = (data['data'] as List<dynamic>)
            .map((item) => RelatedProduct.fromJson(item))
            .toList();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load items')),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Container(
              height: 392,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/medicinebg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New Arrivals',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(225, 255, 239, 239),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'View All',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final product = items[index];
                        return _buildProductCard(context, product);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}


Widget _buildProductCard(BuildContext context, RelatedProduct product) {
  final images = product.images;
  final mediumImageUrl = images[0].medium;

  return Container(
    margin: const EdgeInsets.only(left: 14, right: 8, top: 0, bottom: 20),
    height: 300,
    width: 165,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Get.to(() => ProductPage(id: product.id)),
              child: Container(
                height: 165,
                width: 165,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(mediumImageUrl),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 120, 
                    child: Text(
                      product.name,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    height: 14,
                    width: 26,
                    padding: EdgeInsets.only(left: 2, right: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.pink.shade50,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          size: 9,
                          color: Color.fromARGB(255, 0, 145, 197),
                        ),
                        Text(
                          '0.5',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 145, 197),
                            fontSize: 8.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    '₹${product.newPrice.toString()}',
                    style: const TextStyle(
                      color: Colors.pink,
                      fontFamily: 'DMSerifDisplay',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '₹${product.oldPrice.toString()}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'DMSerifDisplay',
                      fontSize: 7,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 1.5,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    height: 14,
                    width: 32,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color.fromARGB(255, 1, 104, 155),
                    ),
                    child: Center(
                      child: Text(
                        '${product.discount.toInt()}% OFF',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/heartbutton@4x.png',
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      height: 25,
                      width: 109,
                      'assets/addtocartbutton.png',
                      fit: BoxFit.fill,
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
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: const BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: const Text(
              'New',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}