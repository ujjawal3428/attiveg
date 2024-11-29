import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/cart.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/navigation/categories.dart';
import 'package:homepage/navigation/offer.dart';
import 'package:homepage/navigation/profile.dart';
import 'package:homepage/navigation/switchstores.dart';
import 'package:homepage/notification.dart';
import 'package:homepage/product/product_models.dart';
import 'package:homepage/product/related_products.dart';
import 'package:homepage/search.dart';
import 'package:homepage/wishlist.dart';

class ProductPage extends StatefulWidget {
  final int id;
  const ProductPage({super.key, required this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Use pushReplacement to maintain state and index
    switch (index) {
      case 1:
        Get.off(() => const HomePage());
        break;
      case 2:
        Get.to(() => const OfferPage());
        break;
      case 3:
        Get.to(() => const CategoriesPage());
        break;
      case 4:
        Get.to(() => const ProfilePage());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
            future: fetchProduct(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final product = snapshot.data!;
                print(product.relatedProducts);
                return Scaffold(
                    body: SingleChildScrollView(
                        child: Column(children: [
                      SizedBox(
                        height: 106,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/bg1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: SizedBox(
                              width: 702,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: InkWell(
                                      onTap: () => Get.back(),
                                      child: Image.asset(
                                        'assets/back.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 18),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          height: 40,
                                          width: 169,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.pink.shade100,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(60),
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 2),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      () => const SearchPage());
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          Colors.pink.shade100,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: ClipOval(
                                                    child: Image.asset(
                                                      'assets/search.png',
                                                      width: 30,
                                                      height: 30,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const NotificationPage());
                                                },
                                                child: Image.asset(
                                                  'assets/bell.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const WishlistPage());
                                                },
                                                child: Image.asset(
                                                  'assets/heart.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      () => const CartPage());
                                                },
                                                child: Image.asset(
                                                  'assets/cart.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Product Image
                      Container(
                        height: 350,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          image: DecorationImage(
                            image: NetworkImage(product.images[0].big),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // Product Details
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Name
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(
                                      fontFamily: 'DMSerifDisplay',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Image.asset(
                                            'assets/productheart.png'),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: () {},
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Image.asset(
                                            'assets/productshare.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            // Product Details
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Cetaphil Face Wash Gentle Skin',
                                    style: TextStyle(
                                        fontFamily: 'DMSerifDisplay',
                                        fontSize: 14)),
                                Text('Cleanser for Dry to Normal, Sensitive',
                                    style: TextStyle(
                                        fontFamily: 'DMSerifDisplay',
                                        fontSize: 14)),
                                Text('Skin, 125 ml Hydrating Face Wash with',
                                    style: TextStyle(
                                        fontFamily: 'DMSerifDisplay',
                                        fontSize: 14)),
                                Text('Niacinamide, Vitamin B5',
                                    style: TextStyle(
                                        fontFamily: 'DMSerifDisplay',
                                        fontSize: 14)),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Row with stars and ratings
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow[700]),
                                    Icon(Icons.star, color: Colors.yellow[700]),
                                    Icon(Icons.star, color: Colors.yellow[700]),
                                    Icon(Icons.star, color: Colors.yellow[700]),
                                    Icon(Icons.star_border,
                                        color: Colors.yellow[700]),
                                    const SizedBox(width: 4),
                                    const Text('4.5/5.0'),
                                    const SizedBox(width: 8),
                                    const Text('(21)'),
                                  ],
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Container(
                                  width: 176,
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      const Text(
                                        '₹999',
                                        style: TextStyle(
                                          color: Colors.pink,
                                          fontFamily: 'DMSerifDisplay',
                                          fontSize: 24,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        '₹1089.00',
                                        style: TextStyle(
                                          color: Colors.pink,
                                          fontFamily: 'DMSerifDisplay',
                                          fontSize: 12,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color.fromARGB(
                                              255, 1, 104, 155),
                                        ),
                                        child: const Text(
                                          '7% OFF',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontFamily: 'DMSerifDisplay',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              width: 300,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 50, // Height of the button
                                        width: 120, // Width of the button
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/image1.png'), // Replace with your image path
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/image2.png'), // Replace with your image path
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/image3.png'), // Replace with your image path
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 300,
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter text',
                                    ),
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'check availability',
                                      style: TextStyle(
                                        fontFamily: 'DMSerifDisplay',
                                      ),
                                    ),
                                    onPressed: () {
                                      // Handle button press
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      Container(
                        width: 400,
                        color: Colors.white, // Background color
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          // Highlights Header
                          Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: const SizedBox(
                              child: Text(
                                'Highlights',
                                style: TextStyle(
                                    fontFamily: 'DMSerifDisplay',
                                    color: Colors.pink),
                              ),
                            ),
                          ),

                          // Separator Line
                          Container(
                            decoration:
                                const BoxDecoration(color: Colors.black),
                            height: 1,
                            width: 300,
                          ),

                          // Horizontal Scrollable Images
                          SizedBox(
                            height: 50,
                            width: 300,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/image1.png'), // Replace with your image path
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/image2.png'), // Replace with your image path
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/image3.png'), // Replace with your image path
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Rich Text Paragraph
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Bullet Point
                              const Text(
                                '• ', // Dot character
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              // Paragraph Text
                              Expanded(
                                  child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(
                                      text:
                                          "This is a lorem gypsum hydrate of the eraculer circumstances where a person with high blood pressure would not handle a cup of tea for some milk.",
                                      style: TextStyle(
                                        fontFamily: 'DMSerifDisplay',
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Bullet Point
                              const Text(
                                '• ', // Dot character
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              // Paragraph Text
                              Expanded(
                                  child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(
                                        text:
                                            "This is a lorem gypsum hydrate of the eraculer circumstances where a person with high blood pressure would not handle a cup of tea for some milk.",
                                        style: TextStyle(
                                          fontFamily: 'DMSerifDisplay',
                                        )),
                                  ],
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Bullet Point
                              const Text(
                                '• ', // Dot character
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              // Paragraph Text
                              Expanded(
                                  child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(
                                        text:
                                            "This is a lorem gypsum hydrate of the eraculer circumstances where a person with high blood pressure would not handle a cup of tea for some milk.",
                                        style: TextStyle(
                                          fontFamily: 'DMSerifDisplay',
                                        )),
                                  ],
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Bullet Point
                              const Text(
                                '• ', // Dot character
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              // Paragraph Text
                              Expanded(
                                  child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(
                                      text:
                                          "This is a lorem gypsum hydrate of the eraculer circumstances where a person with high blood pressure would not handle a cup of tea for some milk.",
                                      style: TextStyle(
                                        fontFamily: 'DMSerifDisplay',
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                      ),
                      Container(
                        height: 20,
                        width: 400,
                        decoration: BoxDecoration(color: Colors.pink.shade300),
                      ),

                      Container(
                          width: 400,
                          color: Colors.white, // Background color
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              // Highlights Header
                              Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: const SizedBox(
                                  child: Text(
                                    'Highlights',
                                    style: TextStyle(
                                        fontFamily: 'DMSerifDisplay',
                                        color: Colors.pink),
                                  ),
                                ),
                              ),

                              // Separator Line
                              Container(
                                decoration:
                                    const BoxDecoration(color: Colors.black),
                                height: 1,
                                width: 250,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(
                                      text:
                                          "This is a lorem gypsum hydrate of the eraculer circumstances where a person with high blood pressure would not handle a cup of tea for some milk.",
                                      style: TextStyle(
                                        fontFamily: 'DMSerifDisplay',
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(
                                      text:
                                          "This is a lorem gypsum hydrate of the eraculer circumstances where a person with high blood pressure would not handle a cup of tea for some milk.",
                                      style: TextStyle(
                                        fontFamily: 'DMSerifDisplay',
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Read More",
                                  style: TextStyle(
                                    fontFamily: 'DMSerifDisplay',
                                  ),
                                ),
                              ),
                            ],
                          )),

                      Container(
                        width: 400,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: const Column(),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Light Pink Divider
                          Container(
                            width: double.infinity,
                            height: 5, // Height of the divider
                            color: Colors.pink[100],
                          ),
                          const SizedBox(
                              height: 20), // Margin below the divider

                          // Heading Container
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'Order Information',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // Grey Divider
                          Container(
                            width: double.infinity,
                            height: 2, // Height of the divider
                            color: Colors.grey,
                          ),
                          const SizedBox(
                              height: 10), // Space below the grey divider

                          // Importer Details Row
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons
                                      .business, // Replace with the desired blue icon
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Importer Details',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10), // Space below the row

                          // Flexible Address Text
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: const Text(
                              '1234 Elm Street, Suite 567, Springfield, IL 62704, USA',
                              style: TextStyle(fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 20), // Space below the address

                          // Country of Origin Row
                          Row(
                            children: [
                              const Icon(
                                Icons.public,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 8),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  'Country of Origin',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 5), // Space below the country row

                          // Country Name
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: const Text(
                              'United States',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Pink Heading
                            const Text(
                              'Coupons for You',
                              style: TextStyle(
                                fontFamily: 'DMSerifDisplay',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),

                            // Grey Divider
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 8.0, bottom: 16.0),
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 2,
                              color: Colors.grey,
                            ),

                            // Horizontal List of coupons
                            SizedBox(
                              height: 80, // Adjust height to fit the container
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3, // Number of coupon containers
                                itemBuilder: (context, index) {
                                  return CouponContainer();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      RelatedProducts(
                        relatedProducts: product.relatedProducts,
                      ),
                      Container(
                        width: 350,
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey), // Grey border
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left Side
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '₹3,449.00',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '21% OFF',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '₹3,449.00',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 152,
                              height: 46,
                              child: InkWell(
                                onTap: () {
                                  // Handle button tap here
                                },
                                child: Image.asset(
                                  'assets/addtobag@4x.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )

                      //add more content upwards
                    ])),
                    bottomNavigationBar: BottomNavigator(
                      selectedIndex: _selectedIndex,
                      onItemTapped: _onItemTapped,
                      onSwitchStores: () {
                        SwitchStoresBottomSheet.show(context);
                      },
                    ));
              }
            }));
  }
}

class CouponContainer extends StatelessWidget {
  const CouponContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        height: 69,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/coupan@4x.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(children: [
          Positioned(
            left: 8,
            top: 10,
            child: Text(
              '20% OFF',
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 35,
            child: Text(
              'Lorem ipsum dolor',
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.pink.shade300,
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Coupon copied!')),
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/copy@4x.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}

//NEW ARRIVALS SECTION
Widget _buildNewArrivalsSection(dynamic context) {
  return Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 16),
    child: Container(
      height: 380,
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
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'New Arrivals',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 230, 67),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(color: Colors.white),
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

Widget _buildProductCard(context) {
  return Container(
    margin: const EdgeInsets.only(
        left: 8, right: 8, top: 0, bottom: 15), // Reduced margin
    height: 250, // Reduced from 330
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
              onTap: () => Get.to(() => const ProductPage(id: 11)),
              child: Container(
                height: 180, // Reduced from 239
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
            const SizedBox(height: 4), // Reduced from 8
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
                    height: 50,
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