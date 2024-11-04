import 'package:flutter/material.dart';

// Primary Color Definition
const primaryColor = Color(0xFF00BBE8);
const primaryLightColor = Color(0xFF02CCFF);
const primaryGradientColor = LinearGradient(
  colors: [
    Color(0xFFCBC5FF),
    Color(0xFF00BBE8),
  ]
);

// Secondary Color Definition
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);

// Animation Duration
const animationDuration = Duration(milliseconds: 200);

// Value for Padding Size
const defaultPadding = 20.0;

// Text Style
TextStyle settingStyle = const TextStyle(
  color: textColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

TextStyle subTitleStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
  color: textColor
);

// Form Input
OutlineInputBorder enableOutlineInputBorderMine = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 1.0,
    color: secondaryColor
  ),
  borderRadius: BorderRadius.circular(20.0)
);

OutlineInputBorder focusedOutlineInputBorderMine = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 1.0,
    color: primaryColor
  ),
  borderRadius: BorderRadius.circular(20.0)
);

OutlineInputBorder errorOutlineInputBorderMine = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 1.0,
    color: Colors.red
  ),
  borderRadius: BorderRadius.circular(20.0)
);

OutlineInputBorder focusErrorOutlineInputBorderMine = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 1.0,
    color: Colors.red
  ),
  borderRadius: BorderRadius.circular(20.0)
);

OutlineInputBorder defaultOutlineInputBorderMine = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 1.0,
    color: Colors.white
  ),
  borderRadius: BorderRadius.circular(20.0)
);

