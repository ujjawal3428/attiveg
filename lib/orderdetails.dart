import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              _buildHeader(context),
              const SizedBox(height: 20),

              // Order Info
              _buildOrderInfo(),
              const SizedBox(height: 10),

              // Shipping Address
              _buildShippingAddress(),
              const SizedBox(height: 10),

              // Items to be delivered
              _buildItemsList(),
              const SizedBox(height: 10),

              // Bill Summary
              _buildBillSummary(),
              const SizedBox(height: 10),

              // Cancel Button
              _buildCancelButton(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
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
        image: DecorationImage(
          image: const AssetImage('assets/bg1.jpg'),
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
                onTap: () => Get.back(),
                child: Image.asset(
                  'assets/back.png',
                  width: 30,
                  height: 30,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.arrow_back, size: 30),
                ),
              ),
            ),
            const SizedBox(width: 18),
            Text(
              'Order Details',
              style: TextStyle(
                color: Colors.pink.shade600,
                fontFamily: 'DMSerifDisplay',
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderInfo() {
    return Container(
      width: double.infinity,
      color: Colors.pink[50],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Order Number',
                    style: TextStyle(fontFamily: 'DMSerifDisplay'),
                  ),
                  Text(
                    'NYK-9232842940242',
                    style: TextStyle(fontFamily: 'DMSerifDisplay'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Placed On',
                    style: TextStyle(fontFamily: 'DMSerifDisplay'),
                  ),
                  Text(
                    'Tue, 17 Sep',
                    style: TextStyle(fontFamily: 'DMSerifDisplay'),
                  ),
                ],
              ),
            ),
            Column(
              children: const [
                Text(
                  '₹5364',
                  style: TextStyle(fontFamily: 'DMSerifDisplay'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingAddress() {
    return Container(
      width: double.infinity,
      color: Colors.pink[50],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Shipping Address',
                style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  color: Colors.pink,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Text(
                  'Hamza ali',
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 220, 220, 220),
                    ),
                    child: const Text(
                      'HOME',
                      style: TextStyle(
                        fontSize: 8.49,
                        fontFamily: 'DMSerifDisplay',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Street: C501, Vishal Apt, Behind Vishal Hall, Andheri Kurla Rd',
                  style: TextStyle(fontFamily: 'DMSerifDisplay'),
                ),
                Text(
                  'Andheri(e)',
                  style: TextStyle(fontFamily: 'DMSerifDisplay'),
                ),
                Text(
                  'City: Mumbai',
                  style: TextStyle(fontFamily: 'DMSerifDisplay'),
                ),
                Text(
                  'State/province/area: Maharastra',
                  style: TextStyle(fontFamily: 'DMSerifDisplay'),
                ),
                Text(
                  'Phone number 02226833712',
                  style: TextStyle(fontFamily: 'DMSerifDisplay'),
                ),
                Text(
                  'Zip code 400069',
                  style: TextStyle(fontFamily: 'DMSerifDisplay'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsList() {
    return Container(
      width: double.infinity,
      color: Colors.pink[50],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Items to be delivered',
                style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  color: Colors.pink,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 2),
            _buildItemTile(),
            _buildDivider(),
            _buildItemTile(),
            _buildDivider(),
            _buildItemTile(),
          ],
        ),
      ),
    );
  }

  Widget _buildItemTile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          color: Colors.white,
          child: Image.asset(
            'assets/your_image.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[200],
              child: const Icon(Icons.image),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Densita Everyday Clarifying Shampoo',
                style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Arriving by date Sun. 22 Sept',
                style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  color: Colors.grey,
                ),
              ),
              Text(
                'Qty: 1',
                style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            '₹ 5364',
            style: TextStyle(
              fontFamily: 'DMSerifDisplay',
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 1,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 220, 220, 220),
        ),
      ),
    );
  }

  Widget _buildBillSummary() {
    return Container(
      width: double.infinity,
      color: Colors.pink[50],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Bill Summary',
                style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  color: Colors.pink,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cart MRP',
                      style: TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Other Services',
                      style: TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Total discount',
                      style: TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₹4398',
                      style: TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '₹19',
                      style: TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '-₹2201',
                      style: TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            _buildDivider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'To be paid',
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 16,
                  ),
                ),
                Text(
                  '₹2216',
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        child: TextButton(
          onPressed: () {
            // Add your cancel order logic here
          },
          child: const Text(
            'Cancel Order',
            style: TextStyle(
              fontFamily: 'DMSerifDisplay',
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
