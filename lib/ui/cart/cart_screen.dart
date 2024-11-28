import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/state-management/cart_provider.dart';
import 'package:stellar_store/ui/cart/components/my_counter.dart';
import 'package:stellar_store/ui/detail/components/add_to_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
        
    final Size size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Shopping Cart",
          style: titleStyle,
        ),
        centerTitle: true,
      ),
      body: cartProvider.items.isEmpty
      
      // Kalau kosong
      ? Center(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/illustration/empty-cart.png',
                width: size.width * 0.8,
              ),
              const SizedBox(height: defaultPadding * 2),
              Text(
                "Your Cart is Empty",
                style: titleStyle,
              ),
            ],
          ),
        ),
      ) 

      : ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: defaultPadding / 2,
              horizontal: defaultPadding
            ),
            color: Colors.white,
            elevation: 0,
            shadowColor: Colors.transparent,
            // Content
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Data Barang
                  SizedBox(
                    child: Image.asset(
                      cartItem.image,
                      height: 100,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.title,
                        style: subTitleStyle,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "IDR ${cartItem.price}k"
                      ),
                    ],
                  ),
              
                  // Action
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
       
                        onPressed: () {
                          cartProvider.removeItems(cartItem.id);
                        }, 
                        icon: SvgPicture.asset(
                          "assets/icons/fi-rr-cross-small.svg",
                          colorFilter: ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                        ),
                      ),
              
                      MyCounter(productId: cartItem.id)
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),

      // Total
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: subTitleStyle,
            ),
            Row(
              children: [
                Text(
                  "IDR ${cartProvider.totalPrice}k",
                  style: titleStyle,
                ),
                SizedBox(width: defaultPadding),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    boxShadow: [shadowMine]
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadiusSizeMine)
                      )
                    ),
                    onPressed: () {}, 
                    child: Text(
                      "Checkout",
                      style: buttonColorBgStyle,
                    )
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}