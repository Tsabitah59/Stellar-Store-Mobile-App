import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_store/const.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  final List<Map<String, dynamic>> walletList = [
    {
      'icon': 'assets/icons/fi-rr-diamond.svg',
      'text': "StellarJade",
      'title': "StellarJade",
    },
    {
      'icon': '/assets/icons/fi-rr-star.svg',
      'text': "OnericShard",
      'title': "OnericShard",
    },
    {
      'icon': 'assets/icons/fi-rr-ticket.svg',
      'text': "Voucher",
      'title': "Voucher",
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

  Widget _customWalletCard(String icon, String text) {
    return Card(
      elevation: 0,
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
