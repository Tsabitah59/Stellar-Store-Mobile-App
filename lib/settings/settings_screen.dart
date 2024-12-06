import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/main.dart';
import 'package:stellar_store/settings/components/account_settings.dart';
import 'package:stellar_store/settings/components/app_settings.dart';
import 'package:stellar_store/state-management/theme_prvider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account & Settings',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600
          ),

        ),
        actions: [
          IconButton(
            // Proses utama yang jalan
            onPressed: () {
              
              globalThemeProvider.toggleTheme(!themeProvider.isDarkTheme);
              // Bang operator digunakan untuk negasi (di depan) dan nullable (di belakang)
            },

            icon: SvgPicture.asset(
              globalThemeProvider.isDarkTheme ? 'assets/icons/fi-rr-moon.svg' : 'assets/icons/fi-rr-sun.svg',
              colorFilter: ColorFilter.mode(themeProvider.isDarkTheme ? Colors.yellow : Colors.orange, BlendMode.srcIn),

            ),
          )
        ],
      ),

      

      body: const Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: 
        Column(
          children: [
            AccountSettings(),
            SizedBox(height: defaultPadding),
            AppSettings()
          ],
        ),

      )
    );
  }
}