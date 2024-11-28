import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {

  final List<String> imageList = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
    'assets/images/banner4.png',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [shadowDieMine]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadiusSizeMine),
          child: SizedBox(
            height: 150,
            child: CarouselSlider(
              items: imageList.map((imagePath) {
                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  )
                );
              }).toList(), 
              options: CarouselOptions(
                height: 300,
                viewportFraction: 1.0, // Menghilangkan efek padding antar item
                enableInfiniteScroll: true,
                autoPlay: true,
              )
            ),
          ),
        ),
      ),
    );
  }
}