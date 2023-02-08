import 'package:flutter/material.dart';
import 'package:oppo_clock_app/screens/layouts/layout_screen.dart';
import 'package:oppo_clock_app/screens/splash/splash_screen.dart';

final Map<String,WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => const SplashScreen(),
  LayoutScreen.routeName : (context) => const LayoutScreen()
};