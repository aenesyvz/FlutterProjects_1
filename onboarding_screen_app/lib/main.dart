import 'package:flutter/material.dart';
import 'package:onboarding_screen_app/routes.dart';
import 'package:onboarding_screen_app/screens/onBoarding/onBoarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoardingScreen.routeName,
      routes: routes,
    );
  }
}
