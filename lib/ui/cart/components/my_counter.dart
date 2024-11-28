import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/state-management/cart_provider.dart';

class MyCounter extends StatefulWidget {
  const MyCounter({super.key, required this.productId});

  final String productId;

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {

  int quantity = 1;

  @override
  Widget build(BuildContext context) {

    // Inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);
    final currentQuantity = cartProvider.getQuantity(widget.productId);
    
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (currentQuantity > 1) {
              cartProvider.updateQuantity(widget.productId, currentQuantity - 1);
            }
          }, 
          icon: SvgPicture.asset(
            'assets/icons/fi-rr-minus-small.svg',
             colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
          )
        ),
        Text(
          "${cartProvider.getQuantity(widget.productId.toString())}",
          style: const TextStyle(
            color: textColor
          ),
        ),
        IconButton(
          onPressed: () {
            cartProvider.updateQuantity(widget.productId, currentQuantity + 1);
          }, 
          icon: SvgPicture.asset(
            'assets/icons/fi-rr-plus-small.svg',
            colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
          )
        )
      ],
    );
  }
}