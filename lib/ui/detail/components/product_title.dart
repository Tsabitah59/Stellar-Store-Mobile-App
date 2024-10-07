import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    const double imageWidthRatio = 0.60; //35% dari lebar layar
    const double imageheigthRatio = 0.28; //ngambil 20% dari tinggi layar

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          const Text(
            "Flower Bouquet",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Price",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "${product.price}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                  width: size.width * imageWidthRatio, // gunakan ratio untuk lebar gambar.
                  height: size.height * imageheigthRatio, // Gunakan ratio untuk tinggi gambar.
                  fit: BoxFit.contain,
                ))
          ])
        ],
      ),
    );
  }
}
