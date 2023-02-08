import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:oppo_clock_app/models/alarm.dart';

import 'package:oppo_clock_app/screens/alarm/get_list_alarm.dart';
import 'package:oppo_clock_app/screens/layouts/layout_screen.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: const GetListAlarm(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addAlarm(context);
        },
        backgroundColor: const Color.fromARGB(255, 120, 119, 119),
        child: const Icon(Icons.add),
      ),
    );
      
  }

  Future<dynamic> addAlarm(BuildContext context) {
    late bool isRingOnce = true;
  
    DateTime _dateTime;
    late int minute;
    late int second;
    late bool isVibrate = true;
    late bool isSnooze = false;
    late String name;

    return showMaterialModalBottomSheet(
          context: context,
          builder: (context) => SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Container(
              
              decoration: BoxDecoration(color: Colors.grey.shade800,borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
            //color: Colors.grey.shade800,
          
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      GestureDetector(onTap: () {
                          Navigator.pop(context);
                        },child: const Icon(Icons.close_rounded,color: Colors.white,)
                      ),
                      
                      const Text("New Alarm",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      
                      GestureDetector(
                        onTap: () { 
                          items.add(Alarm(id: "5",isActive: true,isSnooze: isSnooze,isVibrate: isVibrate,minute: minute,name: "Bıktım",seconds: second));
                          Navigator.pop(context);
                            Navigator.pushNamed(context, LayoutScreen.routeName);
                          },
                          child: const Icon(Icons.check_rounded,color: Colors.white,)),
                    ],
                  ),
                  Center(child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:16.0),
                    child: Text("Alarm will ring in 23 h 59 min.",style: TextStyle(color: Colors.grey.shade300),),
                  )),

                  TimePickerSpinner(
                      is24HourMode: true,
                      normalTextStyle:  TextStyle(
                        fontSize: 24,
                        color: Colors.grey.shade400,
                      ),
                      highlightedTextStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.red
                      ),
                      spacing: 50,
                      itemHeight: 80,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        setState(() {
                          _dateTime = time;
                          minute = _dateTime.hour;
                          second = _dateTime.minute;
                        });
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                      child: ElevatedButton(
                        onPressed:(){
                          setState(() {
                             isRingOnce = true;
                          });
                         },
                      //   onPressed: (){setState(() {
                      //   isRingOnce = !isRingOnce;
                      // });},
                      style: ElevatedButton.styleFrom(primary: isRingOnce ? const Color.fromARGB(255, 139, 9, 7):Colors.grey.shade600), child:  Text("Ring once",style: TextStyle(color:isRingOnce == true ? Colors.red:Colors.white,fontSize: 16))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                      child: ElevatedButton(
                         onPressed:(){
                          setState(() {
                             isRingOnce = false;
                          });
                         },
                      //   onPressed: (){setState(() {
                      //   isRingOnce = false;
                      // });},
                      style: ElevatedButton.styleFrom(primary:!isRingOnce? Colors.grey.shade600:const Color.fromARGB(255, 139, 9, 7)), child: Text("Custom",style: TextStyle(color:isRingOnce == true ? Colors.white:Colors.red,fontSize: 16))),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                    Text("Alarm name",style: TextStyle(color: Colors.white,fontSize: 20),),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        //labelText: "Name",
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Alarm",
                        
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text("Vibrate",style: TextStyle(color: Colors.white,fontSize: 20),),
                     Switch(
                        value:isVibrate,
                        onChanged: ((value) {
                          setState(() {
                            isVibrate = !value;
                          });
                        }),
                        activeColor: Colors.red,
                )],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text("Snooze",style: TextStyle(color: Colors.white,fontSize: 20),),
                     Switch(
                        value:isSnooze,
                        onChanged: ((value) {
                          setState(() {
                            isSnooze = !value;
                          });
                        }),
                        activeColor: Colors.red,
                )],
                )
                ],
              ),
            ),
                  ),
          ));
  }
}