import 'package:flutter/material.dart';
import 'package:new_cola/pages/alarm/alarm.dart';
import 'package:new_cola/pages/home/home.dart';
import 'package:new_cola/pages/land/land.dart';
import 'package:new_cola/pages/myinfo/my_info.dart';
import 'package:new_cola/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  List<Widget> pagesArr = [
    HomePage(),
    LandPage(),
    AlarmPage(),
    MyInfoPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesArr[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.castle), label: 'land'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'alarm'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'myinfo'),
        ],
      ),
    );
  }
}
