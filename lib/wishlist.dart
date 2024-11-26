import 'package:flutter/material.dart';
import 'package:homepage/bottomnavigator.dart';
import 'package:homepage/homepage.dart';

import 'package:homepage/navigation/categories.dart';
import 'package:homepage/navigation/offer.dart';
import 'package:homepage/navigation/profile.dart';
import 'package:homepage/navigation/switchstores.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    // Update the selected index and navigate accordingly
    setState(() {
      _selectedIndex = index;
    });

   
    switch (index) {
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 2:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OfferPage()));
        break;
      case 3:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CategoriesPage()));
        break;
      case 4:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                    offset: const Offset(0, 7),
                    blurRadius: 10,
                    spreadRadius: 10,
                    ),
                  ],
                  color: Colors.grey,
                  image: const DecorationImage(
                    image: AssetImage('assets/bg1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            'assets/back.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Text(
                        'Wishlist',
                        style: TextStyle(
                          color: Colors.pink.shade600,
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              WishlistContainer(),
              const SizedBox(height: 20),
              WishlistContainer(),
              const SizedBox(height: 20),
              WishlistContainer(),
              const SizedBox(height: 20),
              WishlistContainer(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigator(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped, 
          onSwitchStores: () { 
             SwitchStoresBottomSheet.show(context);
           },
        ),
      ),
    );
  }
}

class WishlistContainer extends StatelessWidget {
  const WishlistContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 5),
            blurRadius: 0.5,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        children: [
          Container(
            height: 130,
            width: 120,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/medicine.png'),
              ),
            ),
          ),
          SizedBox(
            height: 133,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 135,
                      height: 36,
                      child: Text(
                        'Truderma Absolute Radiance Serum',
                        style: TextStyle(fontFamily: 'DMSerifDisplay', fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Container(
                      height: 14,
                      width: 35,
                      padding: const EdgeInsets.only(left: 4, right: 2, bottom: 2 , top: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.pink.shade50,
                      ),
                      child: const Row(
                        children: [
                          Icon(size: 9, Icons.star, color: Color.fromARGB(255, 0, 145, 197)),
                          Text(
                            '4.5',
                            style: TextStyle(color: Color.fromARGB(255, 0, 145, 197), fontSize: 8.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  width: 176,
                  alignment: Alignment.topLeft,
                  child: Text(
                    '250ml',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                ),
                Container(
                  width: 176,
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const Text(
                        '₹999',
                        style: TextStyle(color: Colors.pink, fontFamily: 'DMSerifDisplay', fontSize: 19),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '₹1089.00',
                        style: TextStyle(color: Colors.grey, fontFamily: 'DMSerifDisplay', fontSize: 8.4, decoration: TextDecoration.lineThrough, decorationThickness: 2,  decorationColor: Colors.grey, ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 16,
                        width: 38,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromARGB(255, 1, 104, 155),
                        ),
                        child: Center(
                          child: const Text(
                            '7% OFF',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'DMSerifDisplay',
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/addtocartbutton.png',
                    width: 174,
                    height: 36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
