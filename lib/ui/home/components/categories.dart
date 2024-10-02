import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<String> categories = [
    "Bag",
    "Footwear",
    "Watches",
    "Dress"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
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
      child: Text(
        categories[index],
        style: TextStyle(
          color: selectedIndex == index ? primaryColor : secondaryColor,
        ),
      ),
    );
  }
}