import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_store/const.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  final List<Map<String, dynamic>> walletList = [
    {
      'icon': 'assets/icons/fi-rr-diamond.svg',
      'text': "StellarJade",
      'amount': "IDR 1140k",
    },
    {
      'icon': 'assets/icons/fi-rr-star.svg',
      'text': "OnericShard",
      'amount': "IDR 20",
    },
    {
      'icon': 'assets/icons/fi-rr-ticket.svg',
      'text': "Voucher",
      'amount': "100",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding * 2),
        Text(
          "My Wallet",
          style: titleStyle,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Ubah arah ListView jadi horizontal
            itemCount: walletList.length,
            itemBuilder: (context, index) {
              return _customWalletCard(
                walletList[index]['icon'],
                walletList[index]['text'],
                walletList[index]['amount'],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _customWalletCard(String icon, String text, String amount) {
    return Card(
      elevation: 0,
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(1000)
            ),
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            amount,
            style: TextStyle(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
