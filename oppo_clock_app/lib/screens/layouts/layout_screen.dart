import 'package:flutter/material.dart';
import 'package:oppo_clock_app/screens/layouts/components/body.dart';

class LayoutScreen extends StatelessWidget {
  static String routeName = "/Layout";

  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      backgroundColor: Colors.black,
    );
  }
}