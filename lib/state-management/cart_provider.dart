import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;

  CartItem({required this.id, required this.title, required this.price, required this.image}); 
}

// To knowing what's between OOP and FP (Functional Programming)
class CartProvider with ChangeNotifier{
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;
  int get itemCount => _items.length;

  // Menghitung Total Harga
  int get totalPrice {
    return _items.values.fold(
      0, 
      (sum, item) => sum + item.price
    );
  }

  void addItem(String id, String title, int price, String image) {
    if (_items.containsKey(id)) {
      return;
    } else {
      _items.putIfAbsent(
        id, 
        () => CartItem(id: id, title: title, price: price, image: image)
      );
    }
    notifyListeners();
  }
  void removeItems(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}