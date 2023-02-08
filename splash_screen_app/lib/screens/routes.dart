import 'package:flutter/cupertino.dart';
import 'package:splash_screen_app/screens/home/home_screen.dart';
import 'package:splash_screen_app/screens/splash/splash_screen.dart';

final Map<String,WidgetBuilder> routes = {
  SplashScreen.routeName :(context) => const SplashScreen(),
  HomeScreen.routeName:(context) => const HomeScreen()
};