import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/state-management/wishlist_provider.dart';

class WishlistItemCard extends StatelessWidget {

  final WishlistItem wishlistItem;
  final VoidCallback onRemove;

  const WishlistItemCard({super.key, required this.wishlistItem, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return GestureDetector(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: wishlistItem.color,
                borderRadius: BorderRadius.circular(borderRadiusSizeMine),
              ),
              child: Hero(
                // Memungkinkan trsansisi animasi halus, antar halaman pada widgets yang sama
                tag: "${wishlistItem.id}",
                child: Image.asset(wishlistItem.image),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text(
                      wishlistItem.title,
                      style: subTitleStyle
                    ),
                  ),
                  Text(
                    "IDR ${wishlistItem.price}k"
                  ),
                ],
              ),

              IconButton(
                onPressed: onRemove, 
                icon: SvgPicture.asset(
                  'assets/icons/fi-sr-heart.svg',
                  colorFilter: ColorFilter.mode(Colors.pinkAccent, BlendMode.srcIn),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

  