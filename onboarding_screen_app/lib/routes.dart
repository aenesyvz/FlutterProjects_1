import 'package:flutter/cupertino.dart';
import 'package:onboarding_screen_app/screens/home/home_screen.dart';
import 'package:onboarding_screen_app/screens/onBoarding/onBoarding_screen.dart';

final Map<String,WidgetBuilder> routes = {
  OnBoardingScreen.routeName : (context) => const OnBoardingScreen(),
  HomeScreen.routeName:(context) => const HomeScreen()
};