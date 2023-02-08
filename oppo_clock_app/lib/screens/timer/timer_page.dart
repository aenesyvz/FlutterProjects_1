
import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin{
  int second = 0,minutes = 0,hours=0;
  String digitSeconds = "00",digitMinutes = "00",digitHours = "00";
  Timer? timer;
  bool started = false;
  bool paused = false;

  
  void stop(){
    timer!.cancel();
    setState(() {
      paused = true;
      started = false;
    });
  }

  void reset(){
    timer!.cancel();
    setState(() {
      second = 0;
      minutes = 0;
      hours = 0;

      digitHours = "00";
      digitMinutes = "00";
      digitSeconds = "00";

      started = false;
      paused = true;

    });
  }

   void start(){
    started = true;
    paused = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = second + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if(localSeconds > 59){
        if(localMinutes > 59){
          localHours++;
          localMinutes = 0;
        }else{
          localMinutes++;
          localSeconds = 0;
        }
      }

      setState(() {
        second = localSeconds;
        minutes = localMinutes;
        hours = localHours;

        digitSeconds = (second >= 10) ? "$second":"0$second";
        digitMinutes = (minutes >= 10) ? "$minutes":"0$minutes";
        digitHours = (localHours >= 10) ? "$hours":"0$hours";
      });
     });
  }
  void pause(){
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
     body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical :30.0),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(boxShadow: [const BoxShadow(color:Colors.black,spreadRadius: 10,blurRadius: 10,offset: Offset(0,3))],border: Border.all(width: 3,color: started ?  Colors.red:Color.fromARGB(255, 198, 30, 30).withOpacity(0.6),),borderRadius: BorderRadius.circular(200)),
                  child: Center(
                    child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("$digitHours:$digitMinutes:$digitSeconds",style: const TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w500),),
                            const Text("Timer",style:TextStyle(color: Color.fromARGB(255, 134, 132, 132),fontSize: 25,fontWeight: FontWeight.w300),)
                          ],
                        ))),
              )
            ),
            const SizedBox(height: 100,),
            Expanded(
              child: Container(
                child: (!started && digitHours=="00" && digitMinutes=="00" && digitSeconds=="00") ? startButton():AfterStartingButtonGroup()
              ),
            ),
          ],
        ),
      ),
     ),
    );
  }

Row AfterStartingButtonGroup() {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                             style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 80, 7, 1),minimumSize: Size(120,40)),
                            onPressed: (){reset();},
                            child:  const Text(
                              "Cancel",
                              style: TextStyle(color:Color.fromARGB(255, 250, 49, 49),fontWeight: FontWeight.w600),)),
                          ElevatedButton(
                             style: ElevatedButton.styleFrom(primary: Colors.red,minimumSize: Size(120,40)),
                            onPressed: (){(paused)? start() :stop();},
                            child:  Text(
                              (paused) ? "Resume" : "Pause",
                              style: const TextStyle(color:Colors.white,backgroundColor: Colors.red),))
                        ],
                      );
  }

  ElevatedButton startButton() {
    return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red,minimumSize: Size(250,80)),
                        onPressed: (){start();},
                        child: const Text(
                          "Start",
                          style: TextStyle(color:Colors.white,backgroundColor: Colors.red),));
  }
}