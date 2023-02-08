import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MainHome(),
    );
  }
}

class Page {
  late String title;
  late IconData icons;
  Page({required this.title,required this.icons});
}

List<Page> items = [
    Page(title: "Home",icons : Icons.home),
    Page(title: "Expolere",icons : Icons.explore),
    Page(title: "Search",icons: Icons.search),
    Page(title: "Feed",icons: Icons.feed),
    Page(title: "Post",icons: Icons.post_add),
    Page(title: "Activity",icons: Icons.local_activity),
    Page(title: "Setting", icons: Icons.settings),
    Page(title: "Profile", icons: Icons.person)
];

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}



class _MainHomeState extends State<MainHome> {
  
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: appBar(),
      body: body(),
    );
  }

  Container body() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(5),
      child: Column(
        children:  [
          customTabbar(),
          main()
        ],
      ),
    );
  }

  Container main() {
    return Container(
            margin: const EdgeInsets.only(top:30),
            width: double.infinity,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  items[current].icons,
                  size: 200,
                  color: Colors.green,
                ),
                const SizedBox(height: 10,),
                Text(
                  items[current].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color:Colors.deepPurple
                  ),
                )
              ],
            ),
          );
  }

  SizedBox customTabbar() {
    return SizedBox(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: (() {
                        setState(() {
                          current = index;
                        });
                      }),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: 80,
                        height: 45,
                        decoration: BoxDecoration(
                          color: current == index ? Colors.green : Colors.white54,
                          borderRadius: current == index ? BorderRadius.circular(15) : BorderRadius.circular(10),
                          border: current == index ? Border.all(color: Colors.green,width: 2):null,
                        ),
                        child: Center(
                          child: Text(
                            items[index].title,
                            style: TextStyle(fontWeight: FontWeight.w500, color: current == index ? Colors.white :Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: current == index,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.deepPurpleAccent,
      title: const Text(
        "Custom TabBar",
        style: TextStyle(fontWeight: FontWeight.w500)
      ),
    );
  }
}