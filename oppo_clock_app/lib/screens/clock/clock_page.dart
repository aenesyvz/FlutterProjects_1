import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:oppo_clock_app/screens/clock/get_list_clock.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: const GetListClock(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addClock(context);
        },
        backgroundColor: const Color.fromARGB(255, 120, 119, 119),
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<dynamic> addClock(BuildContext context) {
    return showMaterialModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Container(
              
             
        ),
      )
    );
}
