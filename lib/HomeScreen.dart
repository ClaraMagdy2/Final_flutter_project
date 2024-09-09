import 'package:flutter/material.dart';
import 'package:medical_app_final_project/profilescreen.dart';

import 'HomeScreenTab.dart';
import 'components/Doctorsrow.dart';
import 'components/Service.dart';

class HomeScreen extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  const HomeScreen({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // Track the current selected tab

  // List of screens corresponding to each tab
  late final List<Widget> screens = [
    HomeScreenTab(text: widget.text1),
    ProfileScreenTab(
      text1: widget.text1,
      text2: widget.text2,
      text3: widget.text3,
      text4: widget.text4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Hi ${widget.text1}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'images/person.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: screens[selectedIndex], // Display the selected screen

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index; // Update the selected index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.home, color: Colors.deepPurple),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            activeIcon: Icon(Icons.person, color: Colors.deepPurple),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
            activeIcon: Icon(Icons.message, color: Colors.deepPurple),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
            activeIcon: Icon(Icons.notifications, color: Colors.deepPurple),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            activeIcon: Icon(Icons.settings, color: Colors.deepPurple),
          ),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}


