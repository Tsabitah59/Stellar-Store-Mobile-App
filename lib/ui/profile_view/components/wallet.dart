import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  List<Map<String, dynamic>> walletList = [
    {
      'icon': Icons.insert_chart_outlined_outlined,
      'text' : "Money"
    },
    {
      'icon': Icons.insert_chart_outlined_outlined,
      'text' : "Money"
    },
    {
      'icon': Icons.insert_chart_outlined_outlined,
      'text' : "Money"
    },
    {
      'icon': Icons.insert_chart_outlined_outlined,
      'text' : "Money"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        ListView.builder(
          itemBuilder: (context, index) => _customWalletCard(
            walletList[index]['icon'],
            walletList[index]['text']
          ),
        )
      ]
    );
  }

  Expanded _customWalletCard(IconData icon, String text) {
    return Expanded(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Expanded(
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: 50,
                  ),
                  Text(text)
                ],
              )
            ),
          ),
        ),
      );
  }
}