import 'package:flutter/material.dart';
import 'package:stellar_store/size_config.dart';

// =============== COLORS ===============
// Primary Color Definition
const primaryColor = Color(0xFF00CDFF);
const primaryLightColor = Color(0xFF14D1FF);
const primaryGradientColor = LinearGradient(
  colors: [
    Color(0xFFCBC5FF),
    Color(0xFF00BBE8),
  ]
);

// Secondary Color Definition
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);

// =============== SHADOW ===============
BoxShadow shadowMine = const BoxShadow(
  color: Color(0x4C14D1FF),
  blurRadius: 22.70,
  offset: Offset(0, 14),
  spreadRadius: -3,
);

BoxShadow shadowDieMine = const BoxShadow(
  color: Color.fromARGB(24, 46, 107, 120),
  blurRadius: 22.70,
  offset: Offset(0, 14),
  spreadRadius: -3,
);
// =============== SIZE & DURATION ===============
// Animation Duration
const animationDuration = Duration(milliseconds: 200);

// Value for Padding Size
const defaultPadding = 20.0;

// Border Radius
const borderRadiusSizeMine = 18.0;

// =============== TEXT ===============
TextStyle bigTitleStyle = TextStyle(
  color: primaryColor, 
  fontSize: getProportionateScreenWidth(28.0),
  fontWeight: FontWeight.bold
);
// Title
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

// Subtitle
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

// Button
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

// =============== FORM INPUT ===============
// Default
OutlineInputBorder enableOutlineInputBorderMine = OutlineInputBorder(
  borderSide: BorderSide(
    width: 1.0,
    color: Colors.grey.shade200
  ),
  borderRadius: BorderRadius.circular(borderRadiusSizeMine)
);

// Focus
OutlineInputBorder focusedOutlineInputBorderMine = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 1.0,
    color: primaryColor
  ),
  borderRadius: BorderRadius.circular(borderRadiusSizeMine)
);

// Error
OutlineInputBorder errorOutlineInputBorderMine = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 1.0,
    color: Colors.red
  ),
  borderRadius: BorderRadius.circular(borderRadiusSizeMine)
);

// Focused Error
OutlineInputBorder focusErrorOutlineInputBorderMine = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 1.0,
    color: Colors.red
  ),
  borderRadius: BorderRadius.circular(borderRadiusSizeMine)
);

