import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:splash_screen_app/screens/home/home_screen.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()))
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children:const [
            // Image(
            //   image: AssetImage(""),
            //   width: 300,
            // ),
            Text("Aaa"),
            SizedBox(height: 50,),
            Text("vvvvvvvvvvvvvv"),
            SpinKitThreeBounce(
              color:Colors.deepOrangeAccent,
              size:50.0,
            )
          ],
        ),
      ),
    );
  }
}