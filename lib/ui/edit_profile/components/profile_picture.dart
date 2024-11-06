import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_store/const.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
      Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/images/signUp_light.png',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: -10,
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: primaryColor
              ),
              onPressed: () {}, 
              icon: SvgPicture.asset(
                'assets/icons/Camera-add.svg',
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              )
            ),
          )
        ],
      )
      ],
    );
  }
}