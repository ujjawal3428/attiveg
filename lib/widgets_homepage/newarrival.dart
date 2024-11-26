import 'package:flutter/material.dart';
import 'package:homepage/productpage.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  left: 20, right: 20, top: 20, bottom: 10),
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
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProductCard(context),
                  _buildProductCard(context),
                  _buildProductCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildProductCard(context) {
  return Container(
    margin: const EdgeInsets.only(left: 14, right: 8, top: 0, bottom: 21),
    height: 300, // Reduced from 330
    width: 165, // Reduced from 217 to maintain aspect ratio
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
      borderRadius: BorderRadius.circular(8), // Slightly reduced radius
    ),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
              ),
              child: Container(
                height: 165, // Reduced from 239
                width: 165, // Reduced from 217
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/medicine.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8), // Reduced from 10
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12), // Added fontSize
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,
                          color: Colors.amber, size: 14), // Reduced from 16
                      SizedBox(width: 2), // Reduced from 4
                      Text(
                        '4.5',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10), // Reduced from 12
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 2), // Reduced padding
              child: Text(
                '250ml',
                style: TextStyle(
                    color: Colors.grey, fontSize: 10), // Reduced from 12
              ),
            ),
            const SizedBox(height: 2), // Reduced from 8
            Padding(
              padding: const EdgeInsets.only(left: 8.0), // Reduced from 10
              child: Container(
                width: 134, // Reduced from 176
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    const Text(
                      '₹999',
                      style: TextStyle(
                          color: Colors.pink,
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 16), // Reduced from 19
                    ),
                    const SizedBox(width: 6), // Reduced from 10
                    const Text(
                      '₹1089.00',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 7,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 1.5), // Reduced from 8.4
                    ),
                    const SizedBox(width: 6), // Reduced from 10
                    Container(
                      height: 14, // Reduced from 16
                      width: 32, // Reduced from 38
                      padding: const EdgeInsets.all(1), // Reduced from 2
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(4), // Reduced from 6
                        color: const Color.fromARGB(255, 1, 104, 155),
                      ),
                      child: const Center(
                        child: Text(
                          '7% OFF',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'DMSerifDisplay',
                            fontSize: 6, // Reduced from 7
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8), // Reduced from 10
                  child: SizedBox(
                    height: 25, // Reduced from 35
                    width: 25, // Reduced from 35
                    child: GestureDetector(
                      onTap: () {
                        // Handle button tap here
                      },
                      child: Image.asset(
                        'assets/heartbutton@4x.png',
                        width: 24.0, // Reduced from 30
                        height: 24.0, // Reduced from 30
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    height: 54,
                    width: 109,
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/addtocartbutton.png',
                      ),
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
            padding: const EdgeInsets.symmetric(
                horizontal: 6, vertical: 3), // Reduced from 8,4
            decoration: const BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), // Reduced from 10
                bottomRight: Radius.circular(8), // Reduced from 10
              ),
            ),
            child: const Text(
              'New',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10, // Added smaller font size
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
