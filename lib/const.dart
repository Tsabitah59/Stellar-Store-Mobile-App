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
TextStyle titleStyle = const TextStyle(
  color: textColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
TextStyle titleStyleBgColor = const TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

TextStyle subTitleStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: textColor
);

TextStyle subTitleStyleBgColor = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: Colors.white
);

TextStyle buttonColorBgStyle = const TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w700
);

TextStyle buttonColorStyle = const TextStyle(
  color: textColor,
  fontSize: 16,
  fontWeight: FontWeight.w700
);

// Form Input
OutlineInputBorder enableOutlineInputBorderMine = OutlineInputBorder(
  borderSide: BorderSide(
    width: 1.0,
    color: Colors.grey.shade200
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

