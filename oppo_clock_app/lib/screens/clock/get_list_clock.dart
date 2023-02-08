import 'package:flutter/material.dart';
import 'package:oppo_clock_app/models/clock.dart';



class GetListClock extends StatefulWidget {
  const GetListClock({super.key});

  @override
  State<GetListClock> createState() => _GetListClockState();
}

class _GetListClockState extends State<GetListClock> {
  List<Clock> items = [
    Clock(id: "1",city: "Tosya",minute: "00",second: "48"),
    Clock(id: "2",city: "Berlin",minute: "23",second: "48"),
    Clock(id: "3",city: "Londro",minute: "22",second: "48"),
    Clock(id: "4",city: "Washington",minute: "17",second: "48"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: items.length == 0 ?  noAlarmAdded():getListClock(),
    );
  }
 Center noAlarmAdded() {
    return Center(
      child: Text(
            "No Alarm Added",
            style: TextStyle(
              color: Colors.grey.shade200,
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),
          ),
    );
  }

  ListView getListClock() {
    return ListView.builder(itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 4),
          child: ListTile(
            leading: const Icon(Icons.access_time_outlined,color: Colors.white54,size: 32),
            title: Text(items[index].city,style: TextStyle(color: Colors.grey.shade300,fontSize: 20),),
            subtitle:  Padding(
              padding: const EdgeInsets.symmetric(vertical :8.0),
              child: Text("Today" ,style: TextStyle(color: Colors.grey.shade600,fontSize: 16)),
            ),
            trailing: Text(items[index].minute + ":" + items[index].second,style: const TextStyle(color: Colors.white,fontSize: 32),)
          ),
        );
      }),
      itemCount: items.length,
      );
  }
}