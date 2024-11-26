import 'package:flutter/material.dart';

class LovedBrandsSection extends StatefulWidget {
  final List<dynamic> brands; // Add brands as a parameter
  const LovedBrandsSection({super.key, required this.brands});

  @override
  State<LovedBrandsSection> createState() => _LovedBrandsSectionState();
}

class _LovedBrandsSectionState extends State<LovedBrandsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Loved Brands',
                        style: TextStyle(
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 28,
                          color: Color.fromARGB(187, 213, 139, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset(
                          'assets/star.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    child: const Text('View All'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: widget.brands.length,
                itemBuilder: (context, index) {
                  final brand = widget.brands[index];
                  return Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 0.5),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(brand['image']),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
