import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/state-management/wishlist_provider.dart';
import 'package:stellar_store/ui/explore/components/item_card.dart';
import 'package:stellar_store/ui/wishlist/components/wishlist_item_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          // Search Bar
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
                        enabledBorder:enableOutlineInputBorderMine,
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
                    borderRadius: BorderRadius.circular(borderRadiusSizeMine),
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
          wishlistProvider.wishlistItem.isEmpty

          // Empty Wishlist
          ? Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/illustration/empty-wishlist.png',
                    width: size.width * 0.8,
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  Text(
                    "Your Wishlist is Empty",
                    style: titleStyle,
                  ),
                ],
              ),
            ),
          ) 
          : Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75
                ),
                itemCount: wishlistProvider.wishlistItem.length,
                itemBuilder: (context, index) {
                  final wishlistItem = wishlistProvider.wishlistItem.values.toList()[index];
                  return WishlistItemCard(
                    wishlistItem: wishlistItem,
                    onRemove: () {
                      wishlistProvider.removeItemsFromFav(wishlistItem.id);
                    },
                  );
                } 
              ),
            ),
          ),
        ],
      )
    );
  }
}