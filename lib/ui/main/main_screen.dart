import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/explore/catalouge_screen.dart';
import 'package:stellar_store/ui/home/home_page.dart';
import 'package:stellar_store/ui/profile_view/profile_page_view.dart';
import 'package:stellar_store/ui/wishlist/wishlist_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Dimulainya index untuk proses navigasi
  int _selectedIndex = 0;  

  // Text Styling
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold
  );

  // Komponen Navigasi -> Label
  static List<Widget> widgetOptions = <Widget>[
    const HomePage(),

    const CatalougeScreen(),

    const WishlistPage(),
    
    const ProfilePageView(),
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
      "icon" : 'assets/icons/fi-rr-home.svg',
      "label" : "Home",
      "route" : '/home'
    },
    {
      "icon" : 'assets/icons/fi-rr-shopping-bag.svg',
      "label" : "Explore",
      "route" : '/explore'
    },
    {
      "icon" : 'assets/icons/fi-rr-heart.svg',
      "label" : "Wishlist",
      "route" : '/wishlist'
    },
    {
      "icon" : 'assets/icons/fi-rr-user.svg',
      "label" : "Profile",
      "route" : '/profile'
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Hello, Helatra!",
          style: titleStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: SvgPicture.asset(
              'assets/icons/fi-rr-bell.svg',
              colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
            )
          ),
          IconButton(
            onPressed: () {}, 
            icon: SvgPicture.asset(
              'assets/icons/fi-rr-shopping-cart.svg',
              colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
            )
          )
        ],
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          items: navItems.map((item){
            int index = navItems.indexOf(item);
            return _customBottomNavBar(
              item['icon']!, 
              item['label']!,
              index == _selectedIndex ? primaryColor : secondaryColor
            );
          }).toList(),
          iconSize: 30,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
          onTap: _onItemTapped
        ),
      ),
    );
  }

  BottomNavigationBarItem _customBottomNavBar(String icon, String label, Color color) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
      label: label,
    );
  }
}