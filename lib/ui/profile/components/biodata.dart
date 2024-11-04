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
                  TextFormField(
                    readOnly: true,
                    initialValue: "Helatra",
                    style: subTitleStyle,
                    decoration: const InputDecoration(
                      label: Text(
                        "Full Name",
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding,),
                  TextFormField(
                    readOnly: true,
                    initialValue: "helatra@gmail.com",
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      label: const Text(
                        "Email",
                        style: TextStyle(color: textColor),
                      ),
                      border: defaultOutlineInputBorderMine,
                    ),
                  ),
                  const SizedBox(height: defaultPadding,),
                  TextFormField(
                    readOnly: true,
                    obscureText: true,
                    initialValue: "12345678",
                    style: subTitleStyle,
                    decoration: const InputDecoration(
                      label: Text(
                        "Password",
                        style: TextStyle(color: textColor),
                      ),

                    ),
                  ),
                  const SizedBox(height: defaultPadding,),
                  TextFormField(
                    readOnly: true,
                    obscureText: true,
                    initialValue: "12345678",
                    style: subTitleStyle,
                    decoration: const InputDecoration(
                      label: Text(
                        "Password",
                        style: TextStyle(color: textColor),
                      )
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