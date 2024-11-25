import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // Setter
  bool _isDarkTheme = false;

  ThemeProvider() {
    _loadTheme();
  }

  // Getter (ditandai dengan 'get')
  bool get isDarkTheme => _isDarkTheme;

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