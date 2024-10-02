import 'package:flutter/material.dart';
import 'package:stellar_store/size_config.dart';
import 'package:stellar_store/ui/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We have to call this in our starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}