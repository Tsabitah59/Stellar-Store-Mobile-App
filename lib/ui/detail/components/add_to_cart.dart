import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/state-management/cart_provider.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product, required this.quantity});

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: defaultPadding),
            height: 50,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusSizeMine),
              border: Border.all(color: primaryColor),
            ),

            // Icon button
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/fi-rr-shopping-cart-add.svg',
                colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn)
              ),
              onPressed: () {
                cartProvider.addItem(
                  product.id.toString(),
                  product.title,
                  product.price,
                  product.image,
                  quantity
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Successfully add ${product.title} to cart 🛒"),
                    duration: const Duration(seconds: 3),
                  )
                );
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  maximumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadiusSizeMine))
                ),
                onPressed: () {},
                child: Text(
                  "CHECKOUT",
                  style: buttonColorBgStyle
                )
              ),
            )
          )
        ],
      ),
    );
  }
}