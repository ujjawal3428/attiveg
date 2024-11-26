import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 106,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
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
                    Flexible(
                      child: Container(
                        height: 38,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 5),
                              blurRadius: 1,
                              spreadRadius: 0.5,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 9.0),
                            border: InputBorder.none,
                            hintText: 'Search Products Here',
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(

                      // Add more details or styling as needed
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
