import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stellar_store/const.dart';

// Implementasi konsep OOP (Inheritance)
class ThemeProvider extends ChangeNotifier {
  // Setter: variable yang bersifat private
  bool _isDarkTheme = false;
 
  // loadtheme akan dijalankan oleh ThemeProvider. Triggernya toggleTheme 
  ThemeProvider() {
    _loadTheme();
  }

  // Getter (ditandai dengan 'get')
  bool get isDarkTheme => _isDarkTheme;

  // Getter untuk primaryColor yang berubah berdasarkan tema
  Color get primaryColor => _isDarkTheme ? primaryLightColor : primaryColor;

  // Fungsi asynchronous yang dijalankan di masa depan (ketika user klik)
  void toggleTheme(bool isDark) async {
    // mengelola konfigurasi perubahan 
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    await prefs.setBool('isDarktheme', isDark);
    notifyListeners();
  }

  void _loadTheme() async {
    // SharePreferences diletakkan di dalam karena mengimplementasikan sebuah future yang hanya bisa digunakan di dalam function =D
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // ?? = Elvis operator for defining a default value on our variable (avoid NPE)
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false; // False untuk set default value-nya
    notifyListeners();
  }
}