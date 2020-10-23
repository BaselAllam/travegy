import 'package:flutter/material.dart';
import 'package:travegy/screens/mobile/bottomnavbar/homepage.dart';
import 'package:travegy/screens/mobile/bottomnavbar/more.dart';
import 'package:travegy/screens/mobile/bottomnavbar/search.dart';


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

int current = 0;

List screens = [
  HomePage(), Search(), Account(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account'
          ),
        ],
        selectedIconTheme: IconThemeData(color: Colors.indigo, size: 20.0),
        selectedLabelStyle: TextStyle(color: Colors.indigo, fontSize: 15.0, fontWeight: FontWeight.normal),
        selectedItemColor: Colors.indigo,
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 20.0),
        unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal),
        unselectedItemColor: Colors.grey,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: screens[current],
    );
  }
}