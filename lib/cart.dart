import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/wishlist.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 5),
                blurRadius: 0.5,
                spreadRadius: 2,
              ),
            ],
            color: Colors.grey,
            image: const DecorationImage(
              image: AssetImage('assets/bg1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          'assets/back.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    const Text(
                      'Cart',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontFamily: 'DMSerifDisplay'),
                    ),
                  ],
                ),
              ),
              // View Wishlist button
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const WishlistPage());
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'View Wishlist (3)',
                      style: TextStyle(
                          color: Colors.pink,
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Card widget
        SingleChildScrollView(
          child: SizedBox(
            height: 683,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 4,
              margin: const EdgeInsets.all(16),
              child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  height: 680,
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 140,
                              height: 50,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.shopping_cart,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  SizedBox(width: 5),
                                  Text('Order Summary',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 50,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Text',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 100, 100, 100))),
                                  SizedBox(width: 5),
                                  Icon(Icons.circle,
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      size: 10),
                                  SizedBox(width: 5),
                                  Text('233',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 99, 99, 99))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 600,
                          height: 1,
                          color: Colors.grey,
                        ),

                        // CART CONTAINER
                        const SizedBox(height: 8),

                        Container(
                          height: 120,
                          width: 600,
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Container(
                                  height: 110,
                                  width: 72,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/cetaphilsmall.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),

                              // Column for product details and quantity counter
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Cetaphil Gentle Skin Cleanser Dry to Normal Skin with Niacinamide',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Pack of one',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    const SizedBox(height: 8),

                                    // Counter for quantity
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      height: 24,
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            onPressed: () {
                                              // Decrease quantity action
                                            },
                                            child: const Text(
                                              '-',
                                              style: TextStyle(
                                                  color: Colors.pink,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          const Text(
                                            '1',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            onPressed: () {
                                              // Increase quantity action
                                            },
                                            child: const Text(
                                              '+',
                                              style: TextStyle(
                                                  color: Colors.pink,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              // Column for delete button and pricing information
                              Transform.translate(
                                offset: const Offset(0, -7),
                                child: SizedBox(
                                  // padding: const EdgeInsets.only(bottom:2),
                                  height: 95,

                                  child: Column(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.grey),
                                        onPressed: () {
                                          // Delete item action
                                        },
                                      ),
                                      const SizedBox(height: 5),
                                      // Pricing information
                                      const Text(
                                        '₹250',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      const SizedBox(height: 1),
                                      const Text(
                                        '₹200',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //CART TWO CONTAINER

                        const SizedBox(height: 8),

                        Container(
                          height: 112,
                          width: 600,
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Container(
                                  height: 110,
                                  width: 72,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/cetaphilsmall.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),

                              // Column for product details and quantity counter
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Cetaphil Gentle Skin Cleanser Dry to Normal Skin with Niacinamide',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Pack of one',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    const SizedBox(height: 8),

                                    // Counter for quantity
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      height: 24,
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            onPressed: () {
                                              // Decrease quantity action
                                            },
                                            child: const Text(
                                              '-',
                                              style: TextStyle(
                                                  color: Colors.pink,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          const Text(
                                            '1',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            onPressed: () {
                                              // Increase quantity action
                                            },
                                            child: const Text(
                                              '+',
                                              style: TextStyle(
                                                  color: Colors.pink,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              // Column for delete button and pricing information
                              Transform.translate(
                                offset: const Offset(0, -7),
                                child: SizedBox(
                                  // padding: const EdgeInsets.only(bottom:2),
                                  height: 95,

                                  child: Column(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.grey),
                                        onPressed: () {
                                          // Delete item action
                                        },
                                      ),
                                      const SizedBox(height: 5),
                                      // Pricing information
                                      const Text(
                                        '₹250',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      const SizedBox(height: 1),
                                      const Text(
                                        '₹200',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //3rd CONTAINER

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 100,
                            width: 550,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              border:
                                  Border.all(color: Colors.black, width: 0.3),
                              color: const Color.fromARGB(199, 197, 218, 255),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                // first container for image
                                Container(
                                  width: 72,
                                  height: 72,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage('assets/gift.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                // Second container for text and description
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Product Title',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'This is a description of the product.',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),

                                // Third container for quantity
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                  ),
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //biling here subtotal
                        const SizedBox(
                          width: 548,
                          height: 1,
                        ),

                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: const Color.fromARGB(
                                    255, 255, 255, 255)), // Optional border
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildRow('Subtotal', '₹389'),
                              _buildRow('Tax', '₹39'),
                              _buildRow('Shipping', '₹50'),
                              _buildRow('Total', '₹478', isBold: true),
                            ],
                          ),
                        )
                      ])),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        //COUPON HERE
        SizedBox(
          child: Container(
            width: 458,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.card_giftcard, color: Colors.green),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Coupons',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward,
                      color: Colors.green), // Arrow button
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        Container(
          width: 450,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.shopping_cart, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'Delivery',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255), //
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 0.3)),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(width: 40),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Add new address',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    )));
  }
}

Widget _buildRow(String leftText, String rightText, {bool isBold = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        leftText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      Text(
        rightText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ],
  );
}
