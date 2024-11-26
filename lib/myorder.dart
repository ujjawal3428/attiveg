import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/orderdetails.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildSearchAndFilter(),
                      const SizedBox(height: 16),
                      _buildOrderCard(context), // Pass context here
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: Image.asset(
                'assets/back.png',
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 18),
            Text(
              'My Orders',
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
                color: Colors.pink.shade600,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 8),
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.search),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search in orders',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 13),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Row(
              children: [
                Icon(Icons.filter_list),
                SizedBox(width: 8),
                Text('Filter'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderCard(BuildContext context) {
    // Added BuildContext parameter
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/orderbox@4x.png'),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirmed',
                        style: TextStyle(
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 12,
                          color: Color(0xFF03A685),
                        ),
                      ),
                      Text(
                        'Arriving by Sat, 7 Sept',
                        style: TextStyle(
                          fontFamily: 'DMSerifDisplay',
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 28,
                width: 1,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Order Number',
                    style: TextStyle(
                      fontFamily: 'DMSerifDisplay',
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'NYK-979873930',
                    style: TextStyle(
                      fontFamily: 'DMSerifDisplay',
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Items Ordered',
                style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                ),
              ),
              SizedBox(width: 2),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 2),
              Text('3 Items'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildImageContainer('assets/image1.png'),
              const SizedBox(width: 8),
              _buildImageContainer('assets/image2.png'),
              const SizedBox(width: 8),
              _buildImageContainer('assets/image3.png'),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const OrderDetails());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Order Details',
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
