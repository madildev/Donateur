import 'package:flutter/material.dart';
import 'package:donteur/pages/donors/donor_page.dart';
import 'package:donteur/pages/donors/heroes.dart';
import 'package:donteur/pages/donors/new_donation.dart';
import 'package:donteur/pages/donors/profile.dart';

// ignore: must_be_immutable
class BottomNav extends StatefulWidget {
  BottomNav({
    Key? key,
  }) : super(
          key: key,
        );
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    DonorPage(),
    Heroes(),
    StartDonation(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.clean_hands),
            label: 'Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.black38,
        iconSize: 30,
        elevation: 5,
        backgroundColor: Colors.white,
        unselectedFontSize: 10,
        selectedFontSize: 12,
      ),
    );
  }
}
