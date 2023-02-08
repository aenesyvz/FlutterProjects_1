import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: const[
              Icon(
                Icons.home,
                size:200,
                color: Colors.red,
              ),
              Text(
                "Home",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w300,
                  color: Colors.red
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}