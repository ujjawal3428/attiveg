// import 'package:flutter/material.dart';

// void main() {
//   runApp(const FilterScreen());
// }

// class FilterScreen extends StatefulWidget {
//   const FilterScreen({super.key});

//   @override
//   _FilterScreenState createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen> {
//   // State to track checked items and selected button colors
//   List<bool> checkedItems = List.generate(50, (index) => false);
//   String selectedCategory = 'Brands';
//   List<bool> selectedButtons = [
//     true,
//     false,
//     false,
//     false
//   ]; // Track selected button states

//   void toggleCheckbox(int index, bool? value) {
//     setState(() {
//       checkedItems[index] = value ?? false;
//     });
//   }

//   // Sample data for different categories
//   final Map<String, List<String>> categoryData = {
//     'Brands': [
//       'Brand A',
//       'Brand B',
//       'Brand C',
//       'Brand D',
//       'Brand E',
//       'Brand F',
//       'Brand G',
//       'Brand H',
//       'Brand I',
//       'Brand J',
//       'Brand K',
//       'Brand L',
//     ],
//     'Product Form': ['Form A', 'Form B', 'Form C', 'Form D'],
//     'Uses': ['Use A', 'Use B', 'Use C', 'Use D'],
//     'Age': ['0-2 years', '3-5 years', '6-12 years', '13-18 years'],
//   };

//   void updateCategory(String category, int index) {
//     setState(() {
//       selectedCategory = category;
//       checkedItems = List.generate(10, (index) => false); // Reset checked items
//       selectedButtons =
//           List.filled(selectedButtons.length, false); // Reset all button states
//       selectedButtons[index] = true; // Set the clicked button state to true
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Bottom Sheet Example'),
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
//                         height: MediaQuery.of(context).size.height * 0.8,
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   'Filter',
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                                 TextButton(
//                                   onPressed: () => Navigator.pop(context),
//                                   child: const Text('X',
//                                       style: TextStyle(color: Colors.grey)),
//                                 ),
//                               ],
//                             ),
//                             const Divider(
//                                 height: 1,
//                                 thickness: 1,
//                                 color: Colors.grey,
//                                 indent: 14,
//                                 endIndent: 14),
//                             Expanded(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 2,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const SizedBox(height: 20),
//                                         TextButton(
//                                           onPressed: () =>
//                                               updateCategory('Brands', 0),
//                                           style: TextButton.styleFrom(
//                                             foregroundColor: selectedButtons[0]
//                                                 ? Colors.pink
//                                                 : Colors.grey, // Change color
//                                           ),
//                                           child: const Text('Brands'),
//                                         ),
//                                         const SizedBox(height: 20),
//                                         TextButton(
//                                           onPressed: () =>
//                                               updateCategory('Product Form', 1),
//                                           style: TextButton.styleFrom(
//                                             foregroundColor: selectedButtons[1]
//                                                 ? Colors.pink
//                                                 : Colors.grey,
//                                           ),
//                                           child: const Text('Product Form'),
//                                         ),
//                                         const SizedBox(height: 20),
//                                         TextButton(
//                                           onPressed: () =>
//                                               updateCategory('Uses', 2),
//                                           style: TextButton.styleFrom(
//                                             foregroundColor: selectedButtons[2]
//                                                 ? Colors.pink
//                                                 : Colors.grey,
//                                           ),
//                                           child: const Text('Uses'),
//                                         ),
//                                         const SizedBox(height: 20),
//                                         TextButton(
//                                           onPressed: () =>
//                                               updateCategory('Age', 3),
//                                           style: TextButton.styleFrom(
//                                             foregroundColor: selectedButtons[3]
//                                                 ? Colors.pink
//                                                 : Colors.grey,
//                                           ),
//                                           child: const Text('Age'),
//                                         ),
//                                         const Spacer(),
//                                         TextButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               // Clear all checkboxes
//                                               checkedItems = List.generate(
//                                                   10, (index) => false);
//                                             });
//                                           },
//                                           child: const Text('Clear All',
//                                               style: TextStyle(
//                                                   color: Colors.grey)),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const VerticalDivider(
//                                       width: 1,
//                                       thickness: 1,
//                                       color: Colors.grey),
//                                   Expanded(
//                                     flex: 3,
//                                     child: Column(
//                                       children: [
//                                         const SizedBox(height: 15),
//                                         SizedBox(
//                                           height: 35,
//                                           width:
//                                               250, // Set height for the text field
//                                           child: TextField(
//                                             decoration: InputDecoration(
//                                               labelText: 'Search here',
//                                               labelStyle: const TextStyle(
//                                                   color: Colors
//                                                       .grey), // Grey label text
//                                               border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         10), // Border radius
//                                                 borderSide: const BorderSide(
//                                                     color: Color.fromARGB(
//                                                         255,
//                                                         255,
//                                                         255,
//                                                         255)), // Border color
//                                               ),
//                                               suffixIcon: const Icon(
//                                                 Icons.search,
//                                                 color: Colors
//                                                     .grey, // Grey search icon
//                                               ),
//                                             ),
//                                             style: const TextStyle(
//                                                 color: Colors
//                                                     .grey), // Grey text color
//                                           ),
//                                         ),
//                                         const SizedBox(height: 10),
//                                         Expanded(
//                                           child: ListView.builder(
//                                             itemCount:
//                                                 categoryData[selectedCategory]
//                                                         ?.length ??
//                                                     0,
//                                             itemBuilder: (context, index) {
//                                               return Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 4.0),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     const SizedBox(width: 5),
//                                                     Checkbox(
//                                                       value:
//                                                           checkedItems[index],
//                                                       onChanged: (bool? value) {
//                                                         toggleCheckbox(
//                                                             index, value);
//                                                       },
//                                                     ),
//                                                     Expanded(
//                                                       child: Text(
//                                                         categoryData[
//                                                                 selectedCategory]![
//                                                             index],
//                                                         style: const TextStyle(
//                                                             color: Colors
//                                                                 .grey), // Set text color to grey
//                                                       ),
//                                                     ),
//                                                     const SizedBox(
//                                                         width:
//                                                             16), // Space between text and count
//                                                     const Text(
//                                                       '101', // Count number
//                                                       style: TextStyle(
//                                                           color: Colors
//                                                               .grey), // Set count text color to grey
//                                                     ),
//                                                   ],
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             // Handle apply logic here
//                                           },
//                                           style: ElevatedButton.styleFrom(
//                                             foregroundColor: Colors
//                                                 .pink, // Set background color to pink
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                       12), // Set border radius
//                                             ),
//                                             fixedSize: const Size(150,
//                                                 40), // Set width and height
//                                           ),
//                                           child: const Text('Apply', style: TextStyle(fontWeight: FontWeight.bold),),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//                 child: const Text('Open Filter!'),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
