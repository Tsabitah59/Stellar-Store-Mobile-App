import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/ui/detail/components/add_to_cart.dart';
import 'package:stellar_store/ui/detail/components/cart_counter.dart';
import 'package:stellar_store/ui/detail/components/color_and_size.dart';
import 'package:stellar_store/ui/detail/components/description.dart';
import 'package:stellar_store/ui/detail/components/product_title.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    // The way used for making the widget responsive, as the device size
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: product.color,
            appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.favorite_border_outlined)
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProductTitle(product: product),
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    // Ambil 30% dari tinggi layar
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height,
                      left: defaultPadding,
                      right: defaultPadding
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)
                      )
                    ),
                    child: Column(
                      children: [
                        ColorAndSize(product: product),
                        const SizedBox(height: defaultPadding),
                        Description(product: product),
                        const SizedBox(height: defaultPadding),
                        const CartCounter(),
                        const SizedBox(height: defaultPadding),
                        AddToCart(product: product)
                      ],
                    ),
                  )
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}