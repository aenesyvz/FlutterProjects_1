import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oppo_clock_app/screens/alarm/alarm_page.dart';
import 'package:oppo_clock_app/screens/clock/clock_page.dart';
import 'package:oppo_clock_app/screens/stopwatch/stopwatch_page.dart';
import 'package:oppo_clock_app/screens/timer/timer_page.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child:CustomTabBar()
        ),
      ),
    );
  }
}

class CustomTabBar extends StatefulWidget{
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: tabbarView(),
    );
  }

  TabBarView tabbarView() {
    return TabBarView(
      controller: _tabController,
      children: const <Widget>[
        Center(
          child: AlarmPage(),
        ),
        Center(
           child: ClockPage()
        ),
        Center(
            child: StopWatchPage()
        ),
        Center(
            child:TimerPage()
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar( 
      backgroundColor: Colors.black,
      leading: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Center(child: Text("Edit",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
      actions:  [
        InkWell(onTap: (() {
          PopupMenuButton(itemBuilder: (context) => [const PopupMenuItem(textStyle: TextStyle(color: Colors.white),child: Text("Settings"),)]);
        }),
        child: const Icon(Icons.more_vert_rounded,color: Colors.white,))
      ],
      bottom: TabBar(
        indicatorColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: MaterialIndicator(
          color:Colors.red, 
        ),
        labelColor: Colors.red,
        unselectedLabelColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.red),
        controller: _tabController,
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        tabs:  const <Widget>[      
          Tab(
          child: Text("Alarm",selectionColor: Colors.red,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          Tab(
             child: Text("Clock",selectionColor: Colors.red,textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          Tab(
             child: Text("Stopwatch",selectionColor: Colors.red,textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          Tab(
             child: Text("Timer",selectionColor: Colors.red,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Tab tab(String title) {
    return Tab(
            child: Text(title,selectionColor: Colors.red,textAlign: TextAlign.center,style: TextStyle(color:_tabController.index == 0 ?Colors.red :Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
          );
  }
}

