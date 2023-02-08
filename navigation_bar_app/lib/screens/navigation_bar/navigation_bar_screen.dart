import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class NavigationBarScreen extends StatefulWidget {
  static String routeName = "/navigationBar";

  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final screen = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const SettingsPage(),
    const ProfilePage()
  ];

  final items = <Widget>[
     const Icon(Icons.home,size:30),
     const Icon(Icons.search,size:30),
     const Icon(Icons.favorite,size: 30,),
     const Icon(Icons.settings,size: 30,),
     const Icon(Icons.person,size:30)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: const Text("Curved Navigation Bar"),
            elevation: 0,
            centerTitle: true,
          ),
          body:screen[index],
          bottomNavigationBar:Theme(
        data: Theme.of(context).copyWith(iconTheme: const IconThemeData(color:Colors.white)), 
        child: CurvedNavigationBar(
          key: navigationKey,
          backgroundColor: Colors.transparent,
          color:Colors.blue,
          buttonBackgroundColor: Colors.purple,
          height: 60,
          items: items,
          index: index,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) => setState(() {
            this.index = index;
          }),)
        )
        ),
      ),
    );
  }
}













class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text("Home",style: TextStyle(fontSize: 60,color: Colors.white),),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text("Profile",style: TextStyle(fontSize: 60,color: Colors.white),),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text("Search",style: TextStyle(fontSize: 60,color: Colors.white),),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text("Settings",style: TextStyle(fontSize: 60,color: Colors.white),),
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text("Favorite",style: TextStyle(fontSize: 60,color: Colors.white),),
      ),
    );
  }
}