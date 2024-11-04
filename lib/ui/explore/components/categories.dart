import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  int selectedIndex = 0;

  // Inisialisasi viewPager
  List<String> categories = [
    "All",
    "Flower Bouquet",
    "Doll",
    "Puzzle",
    "Blocks",
    "Game Board",
    "Toy Car"
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => _buildCategory(index),
        ),
      ),
    );
  }

  GestureDetector _buildCategory(int index) {
    return GestureDetector(
      onTap: () => {
        setState(() {
         selectedIndex = index;
        })
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, 
                vertical: 8
              ),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: selectedIndex == index ? primaryColor : secondaryColor,
                  ),
                  borderRadius: BorderRadius.circular(36),
                ),
                color: selectedIndex == index ? primaryColor : Colors.white
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: 14,
                  color: selectedIndex == index ? Colors.white : secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}