import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_store/const.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {

  int selectedIndex = 0;

  // Inisialisasi viewPager
  List< Map<String, String>> categories = [
    {
      'icon' : 'assets/icons/fi-rr-flower-bouquet.svg',
      'name' : "Bouquet"
    },

    {
      'icon' : 'assets/icons/fi-rr-gem.svg',
      'name' : "Jewellery"
    },

    {
      'icon' : 'assets/icons/fi-rr-confetti.svg',
      'name' : "Accessory"
    },

    {
      'icon' : 'assets/icons/fi-rr-kite.svg',
      'name' : "Toys"
    },

    {
      'icon' : 'assets/icons/fi-rr-hat-birthday.svg',
      'name' : "Decoration"
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => _buildCategory(
              categories[index]['icon']!,
              categories[index]['name']!,
              index
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildCategory(String icon, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
         selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: selectedIndex == index ? primaryColor.withOpacity(0.2) : secondaryColor.withOpacity(0.2)
              ),
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  selectedIndex == index ? primaryColor : secondaryColor, 
                  BlendMode.srcIn
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 3),
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                color: selectedIndex == index ? primaryColor : secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}