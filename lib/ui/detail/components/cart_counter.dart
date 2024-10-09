import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18)),
                ),
                fixedSize: const Size(0, 30),
                iconColor: textColor
              ),
            onPressed: () {
              setState(() {
                if (numOfItems > 1) {
                  setState(() {
                    numOfItems--;
                  });
                }
              });
            },
            child: const Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: const TextStyle(fontSize: 18, color: textColor),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18)
              ),
            ),
            fixedSize: const Size(0, 30),
            iconColor: textColor
          ),  
          onPressed: () {
            setState(() {
              numOfItems++;
            });
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
