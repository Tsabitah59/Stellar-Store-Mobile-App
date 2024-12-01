import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/state-management/cart_provider.dart';
import 'package:stellar_store/state-management/theme_prvider.dart';
import 'package:stellar_store/state-management/wishlist_provider.dart';
import 'package:stellar_store/ui/auth/login_screen.dart';
import 'package:stellar_store/ui/auth/register_screen.dart';
import 'package:stellar_store/ui/cart/cart_screen.dart';
import 'package:stellar_store/ui/edit_profile/profile_page.dart';
import 'package:stellar_store/ui/explore/catalouge_screen.dart';
import 'package:stellar_store/ui/home/home_page.dart';
import 'package:stellar_store/ui/main/main_screen.dart';
import 'package:stellar_store/ui/profile_view/profile_page_view.dart';
import 'package:stellar_store/settings/settings_screen.dart';
import 'package:stellar_store/ui/splash/splash_screen.dart';
import 'package:stellar_store/ui/wishlist/wishlist_page.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const StellarStore()
    )
  );
}

// (_) adalah dummy parameter

class StellarStore extends StatefulWidget {
  const StellarStore({super.key});

  @override
  State<StellarStore> createState() => _StellarStoreState();
}

class _StellarStoreState extends State<StellarStore> {

  // Tempat MaterialApp
  @override
  Widget build(BuildContext context) {
      return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'StellarStore',
            theme: ThemeData(
              brightness: themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
              scaffoldBackgroundColor: themeProvider.isDarkTheme ? const Color(0xFF141218) : const Color(0xFFFEF7FF),
              fontFamily: 'Muli',
              visualDensity: VisualDensity.adaptivePlatformDensity,
              
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: textColor
                ),
                centerTitle: true
              ),

              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: textColor),
                bodySmall: TextStyle(color: textColor)
              )
            ),
            
            initialRoute: '/',
            routes: {
              '/' : (context) => const SplashScreen(),
              '/register' : (context) => RegisterScreen(),
              '/login' : (context) => LoginScreen(),
              '/main' : (context) => const MainScreen(),
            
              // Main Screens
              '/home' : (context) => const HomePage(),
              '/explore' : (context) => const CatalougeScreen(),
              '/wishlist' : (context) => const WishlistPage(),
              '/profile' : (context) => const ProfilePageView(),

              // App Bar Place
              '/cart' : (context) => CartScreen(),
            
              // Settings
              '/settings' : (context) => const SettingsScreen(),
              '/edit-profile': (context) => const ProfilePage()
            },
          );
        },
    );
  }
}