import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpandfaqs extends StatelessWidget {
  const Helpandfaqs({super.key});

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
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
                      'Help & FAQs',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontFamily: 'DMSerifDisplay'),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for the button here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 15.0,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Contact us',
                            style: TextStyle(
                                fontFamily: 'DMSerifDisplay', fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            // Main container height
            width: 400,
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Browse Topics',
                  style: TextStyle(fontFamily: 'DMSerifDisplay', fontSize: 20),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 318,
                  width: 356,
                  child: Row(
                    children: [
                      // First column with three containers
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 86.0,
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 246, 170, 195),
                                      child: Icon(
                                        size: 20,
                                        Icons.account_balance,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'Account',
                                      style: TextStyle(
                                          fontFamily: 'DMSerifDisplay',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 86.0,
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 209, 248, 246),
                                      child: Icon(
                                        size: 20,
                                        Icons.discount,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'Offers',
                                      style: TextStyle(
                                          fontFamily: 'DMSerifDisplay',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 86.0,
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(169, 0, 220, 161),
                                      child: Icon(
                                        size: 20,
                                        Icons.payments,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Flexible(
                                      child: Text(
                                        'Payments',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'DMSerifDisplay',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Second column with two containers
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 86.0,
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 181, 180, 180),
                                      child: Icon(
                                        size: 20,
                                        Icons.fire_truck,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Flexible(
                                      child: Text(
                                        'Return & Exchange',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'DMSerifDisplay',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 86.0,
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(167, 235, 186, 64),
                                      child: Icon(
                                        size: 20,
                                        Icons.cancel_presentation,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Flexible(
                                      child: Text(
                                        'Cancellation & Charges',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'DMSerifDisplay',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Frequently Asked Questions',
                    style:
                        TextStyle(fontFamily: 'DMSerifDisplay', fontSize: 20),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                    left: 16,
                    right: 16,
                    bottom: 0,
                  ),
                  child: Container(
                    height: 270,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10.0),
                          Container(
                            height: 40.0,
                            width: double.infinity,
                            color: Colors.grey.shade200,
                            alignment: Alignment.topLeft,
                            child: Text(
                              '01',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.grey.shade500),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                child: Text(
                                  'Alright, but what exactly do you do?',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, right: 10, left: 10, bottom: 15),
                                child: IconButton(
                                  icon: const Icon(Icons.cancel),
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  onPressed: () {
                                    // Add your onPressed code here
                                  },
                                  padding: const EdgeInsets.all(10.0),
                                  constraints: const BoxConstraints(),
                                  iconSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'As a creative agency we work with you to develop solutions to address your brand needs. '
                            'That includes various aspects of brand planning and strategy, marketing and design.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //02
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0.0,
                    left: 16,
                    right: 16,
                    bottom: 0,
                  ),
                  child: Container(
                    height: 270,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10.0),
                          Container(
                            height: 40.0,
                            width: double.infinity,
                            alignment: Alignment.topLeft,
                            child: Text(
                              '02',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.grey.shade500),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                child: Text(
                                  'Alright, but what exactly do you do?',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, right: 10, left: 10, bottom: 15),
                                child: IconButton(
                                  icon: const Icon(Icons.cancel),
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  onPressed: () {
                                    // Add your onPressed code here
                                  },
                                  padding: const EdgeInsets.all(10.0),
                                  constraints: const BoxConstraints(),
                                  iconSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'As a creative agency we work with you to develop solutions to address your brand needs. '
                            'That includes various aspects of brand planning and strategy, marketing and design.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //03

                Padding(
                  padding: const EdgeInsets.only(
                    top: 0.0,
                    left: 16,
                    right: 16,
                    bottom: 0,
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      height: 270,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10.0),
                            Container(
                              height: 40.0,
                              width: double.infinity,
                              alignment: Alignment.topLeft,
                              child: Text(
                                '03',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.grey.shade500),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(
                                  child: Text(
                                    'Alright, but what exactly do you do?',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0.0,
                                      right: 10,
                                      left: 10,
                                      bottom: 15),
                                  child: IconButton(
                                    icon: const Icon(Icons.cancel),
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    onPressed: () {
                                      // Add your onPressed code here
                                    },
                                    padding: const EdgeInsets.all(10.0),
                                    constraints: const BoxConstraints(),
                                    iconSize: 30.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'As a creative agency we work with you to develop solutions to address your brand needs. '
                              'That includes various aspects of brand planning and strategy, marketing and design.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
            // You can add more widgets below
            ),
      ]),
    )));
  }
}
