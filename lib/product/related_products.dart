import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/product/product_models.dart';
import 'package:homepage/product/productpage.dart';

class RelatedProducts extends StatelessWidget {
  final List<RelatedProduct> relatedProducts;

  const RelatedProducts({super.key, required this.relatedProducts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        height: 410,
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
                  left: 20, right: 20, top: 20, bottom: 10),
              child: const Text(
                'Related Products',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(225, 255, 239, 239),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: relatedProducts.length,
                itemBuilder: (context, index) {
                  final product = relatedProducts[index];
                  return _buildProductCard(
                      context, product, relatedProducts[index].id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context, RelatedProduct product, int id) {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.to(() => ProductPage(id: id));
        print('id: $id OnTap pressed');
      },
      child: Container(
        margin: const EdgeInsets.only(left: 14, right: 8, bottom: 10),
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
                Container(
                  height: 165,
                  width: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                          product.images.first.medium), // Display product image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DMSerifDisplay',
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          softWrap: true, // Allow text to wrap to the next line
                          overflow:
                              TextOverflow.visible, // Avoid ellipsis truncation
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 14),
                          SizedBox(width: 2),
                          Text(
                            '4.5',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
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
                              fontFamily: 'DMSerifDisplay',
                              fontSize: 6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        onTap: () {
                          // Handle favorite button tap
                        },
                        child: Image.asset(
                          'assets/heartbutton@4x.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          // Handle add to cart button tap
                        },
                        child: Image.asset(
                          'assets/addtocartbutton.png',
                          height: 60,
                          width: 100,
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
      ),
    );
  }
}
