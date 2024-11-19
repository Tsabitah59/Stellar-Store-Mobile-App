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
        title: Text(
          "Edit Profile",
          style: titleStyle,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: defaultPadding,),
            ProfilePicture(),
            SizedBox(height: defaultPadding * 2),
            Biodata(),
            SizedBox(height: defaultPadding * 2),
            SaveButton()
          ],
        ),
      ),
    );
  }
}