import 'package:bottom_navigatiob/Pages/home.dart';
import 'package:bottom_navigatiob/Pages/profile.dart';
import 'package:bottom_navigatiob/Pages/search.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;
  List screens = [
    const Home(),
    const Search(),
    const Profile(),
  ];
  GlobalKey<FancyBottomNavigationState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(title: const Text('Bottom Nav')),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(
                iconData: Icons.home,
                title: "Home",
                ),
            TabData(
                iconData: Icons.favorite,
                title: "Search",
                ),
            TabData(
                iconData: Icons.person,
                title: "Profile",
                ),
          ],
          initialSelection: 0,
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ),
        body: screens[currentPage],
      ),
    );
  }
}
