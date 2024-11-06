import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/ui/detail/detail_screen.dart';
import 'package:stellar_store/ui/explore/catalouge_screen.dart';
import 'package:stellar_store/ui/edit_profile/profile_page.dart';
import 'package:stellar_store/ui/profile_view/profile_page_view.dart';
import 'package:stellar_store/ui/settings/settings_screen.dart';
import 'package:stellar_store/ui/wishlist/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dimulainya index untuk proses navigasi
  int _selectedIndex = 0;  

  // Text Styling
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold
  );

  // Komponen Navigasi -> Label
  static List<Widget> widgetOptions = <Widget>[
    const Text(
      'Index 0: Home',
      style: optionStyle,
    ),

    const CatalougeScreen(),

    const WishlistPage(),
    

    // SettingsScreen(isDarkTheme: _isDarkTheme , onThemeChanged: _toggleTheme),

    const Text(
      'Index 4: Profile',
      style: optionStyle,
    ),

    const ProfilePageView(),
    // const ProfilePage()
  ];

  // void adalah keyword untuk function yang tidak ada nilai kembalian

  // Membuat funcion untuk menandakan awal terjadinya state
  void _onItemTapped(int index) {  
    // Awal state
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  final List<Map<String, dynamic>> navItems = [
    {
      "icon" : Icons.home,
      "label" : "Home"
    },
    {
      "icon" : Icons.shopping_bag,
      "label" : "Explore"
    },
    {
      "icon" : Icons.favorite,
      "label" : "Wishlist"
    },
    {
      "icon" : Icons.settings,
      "label" : "Settings"
    },
    {
      "icon" : Icons.person,
      "label" : "Profile"
    },
  ];

  @override
  Widget build(BuildContext context) {
  final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Location",
              style: TextStyle(
                color: secondaryColor,
                fontSize: 12
              ),
            ),
            Text(
              "Bogor, Indonesia",
              style: subTitleStyle,
            )
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0, 
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: SvgPicture.asset(
              'assets/icons/Notification.svg',
              colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
            )
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.shopping_cart)
          )
        ],
      ),

      body: widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
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
          items: navItems.map((item){
            return _customBottomNavBar(
              Icon(item['icon']), 
              item['label'],
            );
          }).toList(),
          iconSize: 30,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  BottomNavigationBarItem _customBottomNavBar(Widget icon, String label) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}