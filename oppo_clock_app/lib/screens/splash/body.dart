import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oppo_clock_app/screens/layouts/layout_screen.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Navigator.pushNamed(context, LayoutScreen.routeName)
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Center(child: Hero(tag: "1",child: Text("AEY37",style: TextStyle(color: Colors.red,fontSize: 72,fontWeight: FontWeight.bold),))),
            const SizedBox(height: 50,),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 24,
                color: Colors.grey
              ), 
              child: AnimatedTextKit(
                animatedTexts:[
                  TypewriterAnimatedText("Clock App")
                  ]
                ),
            ),
            const Text("Clock App",style: TextStyle(color: Colors.grey,fontSize: 24),),
            const Spacer(),
            const SpinKitThreeBounce(
              color:Colors.red,
              size:5.0,
            )
          ],
         
        ),
      ),
    );
  }
}