import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/state-management/wishlist_provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {

    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Wishlist"
        
        ),
      ),
      body: wishlistProvider.wishlistItem.isEmpty
      ? Center(
          child: Column(
            children: [
              Text(
                "Your Wishlist is Empty",
                style: titleStyle,
              ),
            ],
          )
        ) 
      : ListView.builder(
        itemCount: wishlistProvider.wishlistItem.length,
        itemBuilder: (context, index) {
          final wishlistItem = wishlistProvider.wishlistItem.values.toList()[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 4,
              vertical: defaultPadding / 2
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(wishlistItem.image),
              ),
              title: Text(wishlistItem.title),
              trailing: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/fi-rr-trash.svg',
                  colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
                ),
                onPressed: () {
                  wishlistProvider.removeItemsFromFav(wishlistItem.id);
                }, 
              ),
            ),
          );
        }
      )
    );
  }
}