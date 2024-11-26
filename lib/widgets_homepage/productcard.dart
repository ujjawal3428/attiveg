import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String imagePath;
  final String productName;
  final String volume;
  final double price;
  final double originalPrice;
  final double discount;
  final double rating;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.volume,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 15),
      height: 250,
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
                onTap: () {
                  // Navigate to Product Page
                },
                child: Container(
                  height: 180,
                  width: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 2),
                        Text(
                          widget.rating.toStringAsFixed(1),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 2),
                child: Text(
                  widget.volume,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      '₹${widget.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: Colors.pink,
                        fontFamily: 'DMSerifDisplay',
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '₹${widget.originalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.grey,
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
                          '${widget.discount.toStringAsFixed(0)}% OFF',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      onTap: () {
                        // Handle Wishlist Action
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
                    child: SizedBox(
                      height: 50,
                      width: 109,
                      child: InkWell(
                        onTap: () {
                          // Handle Add to Cart Action
                        },
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
}
