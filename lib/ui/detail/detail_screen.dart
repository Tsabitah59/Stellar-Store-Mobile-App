import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/ui/detail/components/add_to_cart.dart';
import 'package:stellar_store/ui/detail/components/cart_counter.dart';
import 'package:stellar_store/ui/detail/components/color_and_size.dart';
import 'package:stellar_store/ui/detail/components/description.dart';
import 'package:stellar_store/ui/detail/components/fav_button.dart';
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
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wishlist');
            }, 
            icon: SvgPicture.asset(
              'assets/icons/fi-rr-heart.svg',
              colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
            ),    
          ),

          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            }, 
            
            icon: SvgPicture.asset(
              'assets/icons/fi-rr-shopping-cart.svg',
              colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
            )
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProductTitle(product: product),
            SizedBox(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: defaultPadding * 2,
                      bottom: defaultPadding * 2,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColorAndSize(product: product),
                        const SizedBox(height: defaultPadding),
                        Description(product: product),
                        const SizedBox(height: defaultPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CartCounter(),
                            FavButton(product: product)
                          ],
                        ),
                        const SizedBox(height: defaultPadding),
                        AddToCart(product: product)
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height,
                    left: defaultPadding,
                    right: defaultPadding,
                    child: ProductTitle(product: product),
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