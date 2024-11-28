import 'package:flutter/material.dart';

class WishlistItem {
  final String id;
  final String title;
  final int price;
  final String image;
  final Color color;

  WishlistItem({required this.id, required this.title, required this.price, required this.image, required this.color});
}

class WishlistProvider with ChangeNotifier{
  final Map<String, WishlistItem> _wishlistItems = {};

  Map<String, WishlistItem> get wishlistItem => _wishlistItems;

  int get count => wishlistItem.length;

  void addItemToFav(String id, String title, int price, String image, Color color) {
    if (_wishlistItems.containsKey(id)) {
      // Jika ada item yang ditambahkan
      return;
    } else {
      _wishlistItems.putIfAbsent(
        id, 
        () => WishlistItem(id: id, title: title, price: price, image: image, color: color)
      );
    }
    notifyListeners();
  }

  void removeItemsFromFav(String id) {
    _wishlistItems.remove(id);
    notifyListeners();
  }

  void clearWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }
}