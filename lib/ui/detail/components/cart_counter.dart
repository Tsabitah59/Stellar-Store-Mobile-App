import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/state-management/cart_provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;

  // Callback untuk mengirim quantity ke AddToCart

  const CartCounter({super.key, required this.product});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  int quantity = 1;

  @override
  Widget build(BuildContext context) {

    // Inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);
    final updateQuantityYey = cartProvider.updateQuantity(widget.product.id.toString(), quantity);


    return Row(
      children: <Widget>[

        // Logika untuk decrement
        SizedBox(
          // width: 40,
          // height: 40,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusSizeMine),
              )
            ),
            onPressed: quantity > 1 
            ? () {
              setState(() {
                // Mengurangi jumlah secara lokal
                quantity--;
                // updateQuantityYey;
                cartProvider.updateQuantity(widget.product.id.toString(), quantity);
              });
              // Mengirim quantity terbaru
              // cartProvider.removeItems(widget.product.id.toString());
            }
            // disable button jika kurang dari 1
            : null,
             child: SvgPicture.asset(
              'assets/icons/fi-rr-minus-small.svg',
              colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            quantity.toString().padLeft(2, "0"),
            style: const TextStyle(
              fontSize: 18,
              color: textColor
            ),
          ),
        ),
        SizedBox(
          // width: 40,
          // height: 40,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusSizeMine),
              )
            ),
            onPressed: () {
              setState(() {
                // Menambah jumlah secara lokal
                quantity++;
                // updateQuantityYey;
              });
              /**
               * Pendekalrasian informasi yang akan dikirim ke addtoCart
               * Starting point quantitas yang dibawa ke tombol keranjang ke halaman cart
               */
              // Mengirim quantity terbaru
              // cartProvider.addItem(
              //   widget.product.id.toString(),
              //   widget.product.title,
              //   widget.product.price,
              //   widget.product.image,
              //   1
              // );
            }, 
            child: SvgPicture.asset(
              'assets/icons/fi-rr-plus-small.svg',
              colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
            )
          ),
        )
      ],
    );
  }
}