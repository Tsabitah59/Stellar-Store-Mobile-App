import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  final List<Map<String, dynamic>> walletList = [
    {
      'icon': Icons.attach_money,
      'text': "Money",
    },
    {
      'icon': Icons.credit_card,
      'text': "Card",
    },
    {
      'icon': Icons.savings,
      'text': "Savings",
    },
    {
      'icon': Icons.account_balance_wallet,
      'text': "Wallet",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Ubah arah ListView jadi horizontal
        itemCount: walletList.length,
        itemBuilder: (context, index) {
          return _customWalletCard(
            walletList[index]['icon'],
            walletList[index]['text'],
          );
        },
      ),
    );
  }

  Widget _customWalletCard(IconData icon, String text) {
    return Card(
      elevation: 0,
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: primaryColor,
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
