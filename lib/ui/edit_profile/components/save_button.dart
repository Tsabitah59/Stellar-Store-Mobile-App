import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        onPressed: () {}, 
        child: Text(
          "Save Data",
          style: buttonColorBgStyle,
        )
      ),
    );
  }
}