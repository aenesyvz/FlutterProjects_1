import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';


class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  int second = 0,minutes = 0,hours=0;
  String digitSeconds = "00",digitMinutes = "00",digitHours = "00";
  Timer? timer;
  bool started = false;
  bool paused = false;
  List laps = [];


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
      laps = [];
    });
  }

  void pause(){
    timer!.cancel();
  }

  void addLaps(){
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(boxShadow: [BoxShadow(color:(second % 2 == 0)? Colors.red.shade200.withOpacity(0.2):Colors.red.shade200.withOpacity(0.3),spreadRadius: 10,blurRadius: 10,offset: Offset(0,3))],border: Border.all(width: 3,color: Colors.red,),borderRadius: BorderRadius.circular(100)),
                  child: Center(child: Text("$digitHours:$digitMinutes:$digitSeconds",style: const TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),))),
              )
            ),
            Center(
              child: Container(
                height: 150,
                child: ListView.builder(
                  itemCount: laps.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${laps.length-(index)}",style:  TextStyle(color: laps.length -1 == laps.length-(index+1) ? Colors.red:Colors.white,fontSize: 20),),
                          Text("${laps[laps.length-(1 +index)]}",style: const TextStyle(color: Colors.white,fontSize: 20),)
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 50,),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                             style: ElevatedButton.styleFrom(primary: Colors.red,minimumSize: Size(120,40)),
                            onPressed: (){(paused) ? reset() :addLaps();},
                            child:  Text(
                              (paused) ? "Reset":"Lap",
                              style: const TextStyle(color:Colors.white,backgroundColor: Colors.red),)),
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