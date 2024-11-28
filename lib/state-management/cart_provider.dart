import 'package:flutter/material.dart';
import 'package:stellar_store/models/products.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  int quantity;

  CartItem({
    required this.id, 
    required this.title, 
    required this.price, 
    required this.image, 
    // Default quantity
    this.quantity = 1
  }); 
}

// To knowing what's between OOP and FP (Functional Programming)
class CartProvider with ChangeNotifier{
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  Map<String, int> _quantities = {};

  // Method untuk mendapatkan jumlah produk tertentu
  int getQuantity(String productId) => _quantities[productId] ?? 1;

  // Menghitung Total Harga
  int get totalPrice {
    // Inisialisasi status sebelum operasi matematika
    return _items.values.fold(
      0, 
      // sum adalah parameter yang dibuat sendiri. Untuk menandakan ada pejumlahan disana. Bisa tidak digunakan tapi itu wajib
      (sum, item) => sum + item.price * item.quantity
    );
  }

  void addItem(String id, String title, int price, String image, int quantity) {

    // Menambahkan item ke keranjang dengan jumlah yang ditentukan cart_counter
    if (_items.containsKey(id)) {
      // Menambah jumlah barang
      _items[id]!.quantity += quantity;
    } else {
      _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity: quantity);
    }
    notifyListeners();
  }

    // Method untuk mengupdate jumlah
  void updateQuantity(String productId, int quantity) {
    _quantities[productId] = quantity;
    notifyListeners();
  }

  void removeItems(String id) {

    _items.remove(id);

    notifyListeners();
  }
}