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
  int _selectedImageIndex = 0;
  String selectedsection = 'Key-Benefits';

  Widget _buildList(List<String?> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Text('- $item')).toList(),
    );
  }

  Widget _getSectionContent(Product product) {
    switch (selectedsection) {
      case 'Key-Benefits':
        print(product.keyBenefits);
        return _buildList(product.keyBenefits);
      case 'How to use':
        return _buildList(product.howToUse);
      case 'Key Ingredients':
        return _buildList(product.keyIngredients);
      default:
        return const Text('Select a section to view details.');
    }
  }

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
                print(product.keyIngredients);
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
                              width: double.infinity,
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
                                           
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 32),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      () => const SearchPage());
                                                },
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    'assets/search.png',
                                                    width: 25,
                                                    height: 25,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 7),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const NotificationPage());
                                                },
                                                child: Image.asset(
                                                  'assets/bell.png',
                                                  width: 25,
                                                  height: 25,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(width: 7),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const WishlistPage());
                                                },
                                                child: Image.asset(
                                                  'assets/heart.png',
                                                  width: 25,
                                                  height: 25,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(width: 7),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      () => const CartPage());
                                                },
                                                child: Image.asset(
                                                  'assets/cart.png',
                                                  width: 25,
                                                  height: 25,
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
                            image: NetworkImage(
                                product.images[_selectedImageIndex].big),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Horizontal image list
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                List.generate(product.images.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedImageIndex =
                                        index; // Update the selected image index
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 60,
                                  margin: const EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          product.images[index].small),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: _selectedImageIndex == index
                                          ? Colors
                                              .blue // Highlight selected image
                                          : Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      // Product Details
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: double.infinity,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                            text: product.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'DMSerifDisplay',
                                            )),
                                      ],
                                    ),
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
                              

                              // Product Details
                              // const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text('Cetaphil Face Wash Gentle Skin',
                              //         style: TextStyle(
                              //             fontFamily: 'DMSerifDisplay',
                              //             fontSize: 14)),
                              //     Text('Cleanser for Dry to Normal, Sensitive',
                              //         style: TextStyle(
                              //             fontFamily: 'DMSerifDisplay',
                              //             fontSize: 14)),
                              //     Text('Skin, 125 ml Hydrating Face Wash with',
                              //         style: TextStyle(
                              //             fontFamily: 'DMSerifDisplay',
                              //             fontSize: 14)),
                              //     Text('Niacinamide, Vitamin B5',
                              //         style: TextStyle(
                              //             fontFamily: 'DMSerifDisplay',
                              //             fontSize: 14)),
                              //   ],
                              // ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      // Generate the stars dynamically
                                      for (int i = 1; i <= 5; i++)
                                        Icon(
                                          i <= product.ratingsValue!
                                              ? Icons.star // Full star
                                              : i - product.ratingsValue! < 1
                                                  ? Icons.star_half // Half star
                                                  : Icons
                                                      .star_border, // Empty star
                                          color: Colors.yellow[700],
                                        ),
                                      const SizedBox(width: 4),
                                      Text(
                                          '${product.ratingsValue!.toStringAsFixed(1)}/5.0'),
                                      const SizedBox(width: 8),
                                      Text('(${product.ratingsCount})'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),

                              Row(
                                children: [
                                  Container(
                                    width: 308,
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          '₹${product.newPrice.toString()}',
                                          style: TextStyle(
                                            color: Colors.pink,
                                            fontFamily: 'DMSerifDisplay',
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '₹${product.oldPrice.toString()}',
                                          style: TextStyle(
                                            color: Colors.grey,
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
                                          child: Text(
                                            '${product.discount.toInt()}% OFF',
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
                              SizedBox(height: 5),
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
                          SizedBox(height: 5,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedsection = 'Key-Benefits';
                                      });
                                    },
                                    child: Text('Key-Benefits')
                                    ),
                                    SizedBox(width: 10,),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedsection = 'How to use';
                                      });
                                    },
                                    child: Text('How to use')
                                    ),
                                    SizedBox(width: 10,),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedsection = 'Key Ingredients';
                                      });
                                    },
                                    child: Text('Key Ingredients')),
                              ],
                            ),
                          ),
                          // Separator Line
                          Divider(),

                          const SizedBox(height: 16),
                          _getSectionContent(product),
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
                                    'Product Description',
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
                                text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(
                                      text: product.description,
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
                          )
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
                            child: Text(
                              product.importer!,
                              style: TextStyle(fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 20), // Space below the address

                          // Country of Origin Row
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
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
                          ),
                          const SizedBox(
                              height: 5), // Space below the country row

                          // Country Name
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              product.origin!,
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
                        height: 70,
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
                                      '₹${product.oldPrice.toString()}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${product.discount.toInt()}% OFF',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '₹${product.newPrice.toString()}',
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
                Get.snackbar('Coupon Copied!', '');
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
