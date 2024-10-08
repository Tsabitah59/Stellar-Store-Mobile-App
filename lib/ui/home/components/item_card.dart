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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text(
                    "IDR ${product.price}k"
                  ),
                ],
              ),

              IconButton(
                onPressed: () {}, 
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  color: secondaryColor,
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}

  