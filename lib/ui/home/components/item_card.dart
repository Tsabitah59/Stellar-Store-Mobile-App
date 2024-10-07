import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Buat deteksi jari
      onTap: press, // Keluar pilihan kalo ditap lama
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                // Memungkinkan trsansisi animasi halus, antar halaman pada widgets yang sama
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Text(
              product.title,
              style: const TextStyle(
                fontSize: 14,
                color: textColor
              ),
            ),
          ),
          Text(
            "Rp. ${product.price}"
          ),
        ],
      ),
    );
  }
}

  