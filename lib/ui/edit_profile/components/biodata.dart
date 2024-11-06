import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class Biodata extends StatelessWidget {
  const Biodata({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Form(
              child: Column(
                children: [
                  // Name
                  TextFormField(
                    initialValue: "Helatra",
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      label: const Text(
                        "Full Name",
                        style: TextStyle(color: textColor),
                      ),
                      enabledBorder: enableOutlineInputBorderMine,
                      focusedBorder: focusedOutlineInputBorderMine
                    ),
                  ),
                  const SizedBox(height: defaultPadding,),

                  // username
                  TextFormField(
                    initialValue: "helatra_25",
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      label: const Text(
                        "Username",
                        style: TextStyle(color: textColor),
                      ),
                      enabledBorder: enableOutlineInputBorderMine,
                      focusedBorder: focusedOutlineInputBorderMine
                    ),
                  ),
                  const SizedBox(height: defaultPadding,),

                  // Email
                  TextFormField(
                    initialValue: "helatra@gmail.com",
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      label: const Text(
                        "Email",
                        style: TextStyle(color: textColor),
                      ),
                      enabledBorder: enableOutlineInputBorderMine,
                      focusedBorder: focusedOutlineInputBorderMine
                    ),
                  ),
                  const SizedBox(height: defaultPadding,),

                  // Phone Number
                  TextFormField(
                    initialValue: "+62 8123-4567-809",
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      label: const Text(
                        "Phone Number",
                        style: TextStyle(color: textColor),
                      ),
                      enabledBorder: enableOutlineInputBorderMine,
                      focusedBorder: focusedOutlineInputBorderMine
                    ),
                  ),
                ],
              )
            ),
          ],
        )
      ],
    );
  }
}