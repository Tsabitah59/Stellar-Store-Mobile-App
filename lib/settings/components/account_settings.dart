import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_store/const.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {

  List<Map<String, dynamic>> listOption = [
    {
      'icon' : 'assets/icons/fi-rr-user.svg',
      'text' : "Account Details"
    },
    {
      'icon' : 'assets/icons/fi-rr-bell.svg',
      'text' : "Notification Setting"
    },
    {
      'icon' : 'assets/icons/fi-rr-shopping-cart.svg',
      'text' : "Shopping Address"
    },
    {
      'icon' : 'assets/icons/fi-rr-money.svg',
      'text' : "Payment Info"
    },
    {
      'icon' : 'assets/icons/fi-rr-trash.svg',
      'text' : "Delete Account"
    },
  ];

  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      // Account Settings
      Text(
        "Account",
        style: titleStyle,
      ),

      // List Settingnya ehe
      SizedBox(
        height: 80 * listOption.length.toDouble(),
        child: ListView.builder(
          itemCount: listOption.length,
          itemBuilder: (context, index) => _customList(
            listOption[index]['icon']!, 
            listOption[index]['text']!, 
          ),
        ),
      ),
    ]
  );
  }

  Column _customList(String icon, String text) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: defaultPadding / 2),
          leading: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
          ),
          title: Text(
            text,
            style: const TextStyle(color: textColor),
          ),
          trailing: SvgPicture.asset(
            'assets/icons/fi-rr-angle-small-right.svg',
            colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/edit-profile');
          },
        ),
        Divider(
          height: 1,
          color: Colors.grey.shade300,
        )
      ],
    );
  }
}