import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/ui/detail/detail_screen.dart';
import 'package:stellar_store/ui/explore/components/item_card.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search Your Wishlist",
                        suffixIcon: const Icon(
                          Icons.search,
                          color: secondaryColor,
                        ),
                        hintStyle: const TextStyle(color: secondaryColor),
                        enabledBorder: enableOutlineInputBorderMine,
                        focusedBorder: focusedOutlineInputBorderMine
                      ),
                    )
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(left: defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor
                  ),
                  child: IconButton(
                    onPressed: () {}, 
                    icon: const Icon(
                      Icons.filter_list_rounded,
                      color: Colors.white,
                    )
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: defaultPadding,
                    crossAxisSpacing: defaultPadding,
                    childAspectRatio: 0.75
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) => ItemCard(
                    product: product[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(product: product[index])
                      )
                    )
                  ), 
                ),
              )
          )
        ],
      ),
    );
  }
}