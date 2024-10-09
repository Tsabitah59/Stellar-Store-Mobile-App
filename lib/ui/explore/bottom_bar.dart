import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;  

  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          ),
          // Untuk Mengatur BoxShadow
          boxShadow: [  
            BoxShadow(  
              color: Colors.grey.withOpacity(0.2),  
              spreadRadius: 5,  
              blurRadius: 7,  
              offset: const Offset(0, 3), // Pergerakan shadow  
            ),  
          ], 
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Explore"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline_sharp),
              label: "Chat"
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined
              ),
              label: "Profile"
            ),
          ],
          iconSize: 30,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
          onTap: _onItemTapped,
        ),
      );
  }
}