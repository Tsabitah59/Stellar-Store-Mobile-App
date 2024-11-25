import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/state-management/cart_provider.dart';
import 'package:stellar_store/ui/detail/components/add_to_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: titleStyle,
        ),
      ),
      body: cartProvider.items.isEmpty
      ? const Center(child: Text("Your Cart Is Empty")) 
      : ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: defaultPadding / 2,
              horizontal: defaultPadding
            ),
            child: ListTile(
              leading: Container(
                width: 100,
                height: 100,
                child: Image.asset(cartItem.image),
              ),
              title: Text("${cartItem.title}"),
              trailing: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/fi-rr-trash.svg',
                  colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                ),
                onPressed: () {}, 
              ),
            ),
          );
        }
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: subTitleStyle,
            ),
            Text(
              "${cartProvider.totalPrice}",
              style: titleStyle,
            )
          ],
        ),
      ),
    );
  }
}