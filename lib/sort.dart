// import 'package:flutter/material.dart';

// void main() {
//   runApp(const SortPage());
// }

// class SortPage extends StatefulWidget {
//   const SortPage({super.key});

//   @override
//   _SortPageState createState() => _SortPageState();
// }

// class _SortPageState extends State<SortPage> {
//   // State to track checked items
//   List<bool> checkedItems = List.generate(5, (index) => false);

//   // Sample data for sorting options
//   final List<String> sortOptions = [
//     'Relevance',
//     'Popularity',
//     'Average customer rating',
//     'Price : Low to High',
//     'Discount',
//   ];

//   void toggleCheckbox(int index, bool? value) {
//     setState(() {
//       checkedItems[index] = value ?? false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Sort Options'),
//         ),
//         body: Center(
//           child: Builder(
//             builder: (BuildContext context) {
//               return TextButton(
//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     isScrollControlled: true,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.vertical(top: Radius.zero),
//                     ),
//                     builder: (BuildContext context) {
//                       return Container(
//                         height: MediaQuery.of(context).size.height * 0.5,
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   'Sort',
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                                 TextButton(
//                                   onPressed: () => Navigator.pop(context),
//                                   child: const Text('X',
//                                       style: TextStyle(color: Colors.grey)),
//                                 ),
//                               ],
//                             ),
//                             const Divider(height: 1, thickness: 1, color: Colors.grey),
//                             Expanded(
//                               child: ListView.builder(
//                                 itemCount: sortOptions.length,
//                                 itemBuilder: (context, index) {
//                                   return Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 4.0),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Checkbox(
//                                           value: checkedItems[index],
//                                           onChanged: (bool? value) {
//                                             toggleCheckbox(index, value);
//                                           },
//                                         ),
//                                         Expanded(
//                                           child: Text(
//                                             sortOptions[index],
//                                             style: TextStyle(
//                                               color: checkedItems[index] ? Colors.pink : Colors.grey,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Handle apply logic here
//                                 Navigator.pop(context); // Close the bottom sheet after applying
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 foregroundColor: Colors.pink,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 fixedSize: const Size(150, 40),
//                               ),
//                               child: const Text('Apply', style: TextStyle(fontWeight: FontWeight.bold)),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//                 child: const Text('Open Sort Options!'),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
