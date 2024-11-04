import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/settings/components/account_settings.dart';
import 'package:stellar_store/ui/settings/components/app_settings.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key, required this.isDarkTheme, required this.onThemeChanged});

  final bool isDarkTheme;
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account & Settings',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600
          ),

        ),
        actions: [
          IconButton(
            onPressed: () {
              onThemeChanged(!isDarkTheme);
            },
            icon: Icon(
              isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color: isDarkTheme ? Colors.yellow : Colors.orange,
            )
          )
        ],
      ),

      

      body: const Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: AccountSettings()
      )
    );
  }
}