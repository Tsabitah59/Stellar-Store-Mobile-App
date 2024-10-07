import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Row(
                children: [
                  SizedBox(width: 6,),
                  Text("Color"),
                ],
              ),
              Row(
                children: [
                  ColorPicker(
                    color: Color(0xFFD5A7C0), 
                    isSelected: true
                  ),
                  ColorPicker(
                    color: Color(0xFFFBD197), 
                    isSelected: true
                  ),
                  ColorPicker(
                    color: Color(0xFFAAB8DB), 
                    isSelected: true
                  )
                ],
              )
            ],
          )
        ),
        Expanded(
          // Other way to show and modify the text
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Size",
                style: TextStyle(color: textColor),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: textColor),
                  children: [
                    TextSpan(
                      text: "${product.size} cm",
                      style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold)
                    )
                  ]
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent
        )
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        )
      ),
    );
  }
}