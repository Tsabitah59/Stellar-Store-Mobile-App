import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/home/home_page.dart';
import 'package:stellar_store/ui/settings/settings_screen.dart';
import 'package:stellar_store/ui/splash/splash_screen.dart';

void main(){
  runApp(const StellarStore());
}

class StellarStore extends StatefulWidget {
  const StellarStore({super.key});

  @override
  State<StellarStore> createState() => _StellarStoreState();
}

class _StellarStoreState extends State<StellarStore> {
  bool _isDarkTheme = false;

  // override yang bikin sendiri
  @override
  void _initState() {
    super.initState();
    _loadTheme();
  }

  // An Asyncronous Process
  // For Changing theme ehe
  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    });
  }

  // Memulai proses Asyncronous
  // Sebelum loadTheme dijalankan dan digunakan untuk aktivitas toogle
  void _toggleTheme(bool isDark) async {
    // Menyimpan data secara lokal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Await digunakan untuk menyimpan data secara Acyncronous
    setState(() {
      _isDarkTheme = isDark;
    });
    await prefs.setBool('isDarkTheme', isDark);
  }

  // Tempat MaterialApp
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StellarStore',
      theme: ThemeData(
        brightness: _isDarkTheme ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: _isDarkTheme ? Colors.grey.shade900 : Colors.white,
        fontFamily: 'Muli',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: textColor),
          bodySmall: TextStyle(color: textColor)
        )
      ),
      home: // SettingsScreen(isDarkTheme: _isDarkTheme, onThemeChanged: _toggleTheme),
      HomePage()
    );
  }
}