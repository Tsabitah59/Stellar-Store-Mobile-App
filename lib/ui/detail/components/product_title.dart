import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          const Text(
            "Leather Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding),
          Row(children: [
            const Column(
              children: [
                Text(
                  "Price",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            const SizedBox(width: defaultPadding),
            Hero(
              tag: "${product.id}", 
              child: Image.asset(
                product.image,
                fit: BoxFit.fill,
              )
            )
          ]
        )
        ],
      ),
    );
  }
}
