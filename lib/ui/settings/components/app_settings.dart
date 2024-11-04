import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  List<String> settingsOptionList = [
    "Enable Face ID For Log In",
    "Enable Push Notifications",
    "Enable Location Services"
  ];

  List<bool> switchValues = [];
  
  @override  
  void initState() {
    super.initState();
    switchValues = List<bool>.filled(settingsOptionList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      // Account Settings
      Text(
        "App Settings",
        style: settingStyle,
      ),

      Expanded(
        child: ListView.builder(
          itemCount: settingsOptionList.length,
          itemBuilder: (context, index) => _customListForAppSetting(index),
        )
      )
      // List Settingnya ehe
    ]
  );
  }

  Column _customListForAppSetting(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                settingsOptionList[index],
                style: const TextStyle(
                  fontSize: 18
                ),
              ),
              Switch(
                value: switchValues[index], 
                activeColor: primaryColor,
                onChanged: (bool value) {
                  setState(() {
                    switchValues[index] = value;
                  });
                }
              )
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey.shade300,
        )
      ],
    );
  }
}