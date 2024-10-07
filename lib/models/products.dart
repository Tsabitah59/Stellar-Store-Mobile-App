import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product({
    // "this" digunakan untuk menandakan bahwa objek terkait 
    // hanya bisa diakses oleh class terkait atau class yang 
    // sebelumnya memanggil class product.
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    required this.color,
  });
}

List<Product> product = [
  Product(
    id: 1,
    title: "Pink Rose",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/flower_1.png",
    color: const Color(0xFFD5A7C0)
    ),

  Product(
    id: 2,
    title: "Colorful Flower",
    price: 234,
    size: 8,
   description: dummyText,
    image: "assets/images/flower_2.png",
    color: const Color(0xFFD5D3DA)),
  Product(
    id: 3,
    title: "Rainbow Flower",
    price: 234,
    size: 10,
    description: dummyText,
    image: "assets/images/flower_3.png",
    color: const Color(0xFFE6BEC7)),
  Product(
    id: 4,
    title: "Pink, Yellow, White Tulip",
    price: 234,
    size: 11,
    description: dummyText,
    image: "assets/images/flower_4.png",
    color: const Color(0xFFCEB69E)),
  Product(
    id: 5,
    title: "Mix Flower",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/flower_5.png",
    color: const Color(0xFFFADCDF)),
  Product(
    id: 6,
    title: "White Flower",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/flower_6.png",
    color: const Color.fromARGB(255, 198, 197, 189),
  ),
];

String dummyText = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
