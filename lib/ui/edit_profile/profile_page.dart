import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/edit_profile/components/biodata.dart';
import 'package:stellar_store/ui/edit_profile/components/profile_picture.dart';
import 'package:stellar_store/ui/edit_profile/components/save_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Edit Profile",
              style: titleStyle,
            ),
            const SizedBox(height: defaultPadding,),
            const ProfilePicture(),
            const SizedBox(height: defaultPadding * 2),
            const Biodata(),
            const SizedBox(height: defaultPadding,),
            const SaveButton()
          ],
        ),
      ),
    );
  }
}