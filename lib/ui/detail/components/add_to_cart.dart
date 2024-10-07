import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: defaultPadding),
            height: 50,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: product.color),
            ),
            child: IconButton(
              style: IconButton.styleFrom(
                foregroundColor: product.color
              ),
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart)
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: product.color,
                  maximumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                ),
                onPressed: () {},
                child: const Text(
                  "CHECKOUT",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                )
              ),
            )
          )
        ],
      ),
    );
  }
}