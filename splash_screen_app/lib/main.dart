import 'package:flutter/material.dart';
import 'package:splash_screen_app/screens/home/home_screen.dart';
import 'package:splash_screen_app/screens/routes.dart';
import 'package:splash_screen_app/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      // initialRoute: HomeScreen.routeName,
      // routes: routes,
    );
  }
}

