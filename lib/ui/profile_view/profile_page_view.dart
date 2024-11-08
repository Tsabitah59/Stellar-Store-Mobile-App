import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/edit_profile/profile_page.dart';
import 'package:stellar_store/ui/profile_view/components/profile_pic_view.dart';
import 'package:stellar_store/ui/profile_view/components/wallet.dart';
import 'package:stellar_store/ui/settings/settings_screen.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const ProfilePicView(),
              const SizedBox(height: defaultPadding),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const ProfilePage() 
                    )
                    );
                  }, 
                  child: Text(
                    "Profile Settings",
                    style: buttonColorStyle
                  )
                ),
              ),
              // Wallet()
            ],
          ),
        ),
      ),
    );
  }
}