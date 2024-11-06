import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/edit_profile/components/profile_picture.dart';

class ProfilePicView extends StatelessWidget {
  const ProfilePicView({super.key});



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: size.height * 0.15,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          bottom: -defaultPadding / 2,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/signUp_light.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Helatra",
                    style: titleStyleBgColor,
                  ),
                  const Row(
                    children: [
                      Text(
                        "21 Follower",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "100 Following",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}