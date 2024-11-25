import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/state-management/wishlist_provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Inisialisasi provider
    final wishlistProvider = Provider.of<WishlistProvider>(context, listen: true); 

    // Memeriksa barang di wishlist
    final isFavorite = wishlistProvider.wishlistItem.containsKey(product.id.toString());

    return IconButton(
      onPressed: () {
        if (isFavorite) {
          // Menghapus item
          wishlistProvider.removeItemsFromFav(product.id.toString());
        } else {
          // Di bagian sini harus urutan, supaya matching dengan tipe datanya.
          wishlistProvider.addItemToFav(
            product.id.toString(), 
            product.title, 
            product.price,
            product.image
          );
        }
      },
      icon: SvgPicture.asset(
        isFavorite ? 'assets/icons/fi-sr-heart.svg' : 'assets/icons/fi-rr-heart.svg',
        // Pewarnaan ketika like
        colorFilter: ColorFilter.mode(isFavorite ? Colors.pinkAccent : textColor, BlendMode.srcIn),
      ),
    );
  }
}