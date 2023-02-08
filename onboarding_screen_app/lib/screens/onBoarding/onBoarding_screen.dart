import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onboarding_screen_app/screens/onBoarding/components/body.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = "/onBoarding";
  
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}