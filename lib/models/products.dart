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
    image: "asset/images/splash_1.png", 
    title: "Product 1", 
    description: descriptionText, 
    price: 10000, 
    size: 12, 
    color: primaryColor
  ),

  Product(
    id: 1, 
    image: "asset/images/splash_1.png", 
    title: "Product 1", 
    description: descriptionText, 
    price: 10000, 
    size: 12, 
    color: primaryColor
  ),

  Product(
    id: 1, 
    image: "asset/images/splash_1.png", 
    title: "Product 1", 
    description: descriptionText, 
    price: 10000, 
    size: 12, 
    color: primaryColor
  ),

  Product(
    id: 1, 
    image: "asset/images/splash_1.png", 
    title: "Product 1", 
    description: descriptionText, 
    price: 10000, 
    size: 12, 
    color: primaryColor
  ),

  Product(
    id: 1, 
    image: "asset/images/splash_1.png", 
    title: "Product 1", 
    description: descriptionText, 
    price: 10000, 
    size: 12, 
    color: primaryColor
  ),

  Product(
    id: 1, 
    image: "asset/images/splash_1.png", 
    title: "Product 1", 
    description: descriptionText, 
    price: 10000, 
    size: 12, 
    color: primaryColor
  ),
];

String descriptionText = "lorem ipsum dolor sit amet cundos amatizing elit wkwk.";
