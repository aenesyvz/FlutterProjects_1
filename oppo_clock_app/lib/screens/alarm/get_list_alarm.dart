import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oppo_clock_app/models/alarm.dart';

class GetListAlarm extends StatefulWidget {
  const GetListAlarm({super.key});

  @override
  State<GetListAlarm> createState() => _GetListAlarmState();
}

class _GetListAlarmState extends State<GetListAlarm> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body:  items.length == 0 ?   noAlarmAdded() : alarmList(items),
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

  ListView alarmList(List<Alarm> items) {
    return ListView.builder(itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 4),
          child: ListTile(
            title: Text("${items[index].minute}:${items[index].seconds}",style: const TextStyle(color: Colors.grey,fontSize: 32),),
            subtitle:  Padding(
              padding: const EdgeInsets.symmetric(vertical :8.0),
              child: Text(items[index].name ,style: const TextStyle(color: Colors.grey,fontSize: 16)),
            ),
            trailing: InkWell(
              onTap: (){
                 items[index].isActive = !items[index].isActive;
              },
              child: Switch(
                value: items[index].isActive,
                onChanged: ((value) {
                  setState(() {
                    items[index].isActive = !items[index].isActive;
                  });
                }),
                activeColor: Colors.red,
               
              ),
            ),
          ),
        );
      }),
      itemCount: items.length,
      );
  }
}
