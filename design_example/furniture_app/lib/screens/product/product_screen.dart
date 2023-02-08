import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/product/components/body.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: appBar(),
      body: const Body(),
    );
  }
  
  AppBar appBar(){
    return AppBar(
        elevation: 0,
        title: const Text("Dashboard"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset("assetName")),
        ],
      );
  }
}