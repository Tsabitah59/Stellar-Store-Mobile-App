import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.title,
    required this.text,
    required this.image,
  });

  final String title, text, image;
  // Blank Variable

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "StellarStore",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(24.0),
            fontWeight: FontWeight.bold,
            color: Colors.grey
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(defaultPadding * 2),
          child: Image.asset(image,
          fit: BoxFit.contain,)
        ),
        Text(
          title,
          style: TextStyle(
              color: primaryColor, 
              fontSize: getProportionateScreenWidth(36.0),
              fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14
            ),
          ),
        ),
      ],
    );
  }
}

// Method Extraction: Membuat widget menjadi reusable
// Widget Extraction: Pemisah widget dari logic
 
