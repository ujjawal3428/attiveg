import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  final int selectedIndex; // To hold the current index
  final ValueChanged<int> onItemTapped; // Callback to handle item taps
  final VoidCallback onSwitchStores;

  const BottomNavigator({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onSwitchStores,
  });

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {

  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        // Check if the tapped index is the same as the current selected index
        if (index == widget.selectedIndex) {
          return; // Do nothing if the same item is tapped
        }

        if (index == 0) {
          widget.onSwitchStores(); // Call the popup callback for index 0
        } else {
          widget.onItemTapped(index);
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.switch_left_rounded),
          label: 'Switch Stores',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.discount),
          label: 'Discount',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.selectedIndex, 
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.shifting,
    );
  }
}

