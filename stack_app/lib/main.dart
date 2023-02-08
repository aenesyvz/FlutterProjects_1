import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home:const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          bottom: height/2.5,
          child: Image.network("https://i.ibb.co/Y2CNM8V/new-york.jpg",height: height,),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height/2.5,
            width: width,
            color:const Color(0xFF2D2C35)
          ),
        ),
        const Foreground()
      ],
    );
  }
}

class Foreground extends StatelessWidget {
  const Foreground({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    var inputBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(30.0))
    );

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: appBar(),
      body: body(inputBorder, height),
    );
  }

  Padding body(OutlineInputBorder inputBorder, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          const Text("Hello Siti",style: TextStyle(fontSize: 30,color: Colors.white),),
          const SizedBox(height: 5,),
          const Text("Check the weather by the city",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
          const SizedBox(height: 35,),
          TextField(
            decoration:InputDecoration(
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: inputBorder,
              hintText: "Search city",
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
              suffixIcon: const Icon(Icons.search,color: Colors.white,)
            ),
          ),
          const SizedBox(height: 84,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My locations",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
              OutlinedButton(
                onPressed: () {}, 
                child: const Icon(Icons.more_horiz),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(width: 1,color: Colors.white),
                  shape: const CircleBorder()
                ),
              ),
            ],
          ),
          const SizedBox(height: 30,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(var location in locations)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        ColorFiltered(
                          colorFilter: const ColorFilter.mode(Colors.black45, BlendMode.darken),
                          child: Image.network(location.imageUrl,height: height * 0.35,),
                        ),
                        Column(
                          children: [
                            Text(
                              location.text,
                              style: const TextStyle(
                                color:Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Text(location.timing,style: TextStyle(color: Colors.white),),
                            const SizedBox(height: 40,),
                            Text(
                              location.temperature.toString() + "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            const SizedBox(height: 50,),
                            Text(location.weather,style:TextStyle(color: Colors.white),),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
          // for(var location in locations)
          //   ClipRRect(
          //     borderRadius: BorderRadius.circular(8.0),
          //     child: Stack(
          //       alignment: AlignmentDirectional.center,
          //       children: [
          //         ColorFiltered(
          //           colorFilter: const ColorFilter.mode(Colors.black45, BlendMode.darken),
          //           child: Image.network(location.imageUrl,height: height * 0.35,),
          //         ),
          //         Column(
          //           children: [
          //             Text(
          //               location.text,
          //               style: const TextStyle(
          //                 color:Colors.white,
          //                 fontSize: 19,
          //                 fontWeight: FontWeight.w600
          //               ),
          //             ),
          //             Text(location.timing),
          //             const SizedBox(height: 40,),
          //             Text(
          //               location.temperature.toString() + "",
          //               style: const TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 40,
          //                 fontWeight: FontWeight.w600
          //               ),
          //             ),
          //             const SizedBox(height: 50,),
          //             Text(location.weather),
          //           ],
          //         )
          //       ],
          //     ),
          //   )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {  },),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const CircleAvatar(backgroundImage: NetworkImage("https://i.ibb.co/Z1fYsws/profile-image.jpg"),backgroundColor: Colors.black26,))
      ],
    );
  }
}

class Location{
  final String text,timing,weather,imageUrl;
  final int temperature;

  Location({
    required this.text,
    required this.timing,
    required this.temperature,
    required this.weather,
    required this.imageUrl
  });
}

final locations = [
  Location(text: "New York", timing: "10:44 am", temperature: 15, weather: "Cloudy", imageUrl: "https://i.ibb.co/df35Y8Q/2.png"),
  Location(text: "San Francisco", timing: "7:44 am", temperature: 6, weather: "Raining", imageUrl:"https://i.ibb.co/7WyTr6q/3.png" ),
   Location(text: "İstanbul", timing: "10:44 am", temperature: 15, weather: "Cloudy", imageUrl: "https://i.ibb.co/df35Y8Q/2.png"),
  Location(text: "Tosya", timing: "7:44 am", temperature: 6, weather: "Raining", imageUrl:"https://i.ibb.co/7WyTr6q/3.png" ),
];