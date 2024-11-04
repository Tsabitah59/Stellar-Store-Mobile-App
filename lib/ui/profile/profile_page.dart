import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/profile/components/biodata.dart';
import 'package:stellar_store/ui/profile/components/profile_picture.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Edit Profile",
              style: settingStyle,
            ),
            const SizedBox(height: defaultPadding,),
            const ProfilePicture(),
            const SizedBox(height: defaultPadding,),
            const Biodata()
          ],
        ),
      ),
    );
  }
}