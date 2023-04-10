import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new_cola/pages/Auth/login.dart';
import 'package:new_cola/pages/alarm/alarm.dart';
import 'package:new_cola/pages/home/home.dart';
import 'package:new_cola/pages/land/land.dart';
import 'package:new_cola/pages/myinfo/my_info.dart';
import 'package:new_cola/provider/home_tab_provider.dart';
import 'package:new_cola/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (BuildContext context) => HomeTabProvider())
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      // home: const MainPage(),
      home: Login(),
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

  Future<String?> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> saveUserInfo({required String id, required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
    prefs.setString('email', email);
  }

  void getMyInfo() async {
    var token = await loadToken();
    Map<String, String> headers = {
      'authorization': 'Bearer $token',
      'Content-type': 'application/json',
    };

    try {
      Response response = await get(Uri.parse('http://localhost:3000/user/me'),
          headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        if (data['result'] == 'success') {

          var user = data['user'];
          saveUserInfo(id: user['id'] ?? "", email: user['email']);
        } else if (data['result'] == 'failure') {
          showAlertDialog(data['msg']);
        }
      }
      if (response.statusCode == 401) {
        var data = jsonDecode(response.body.toString());
        showAlertDialog(data['msg']);
      }
    } catch (error) {
      throw HttpException('Failed to load event: $error');
    }
  }

  void showAlertDialog(String msg) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("토큰 오류"),
            content: Text(
              "$msg",
            ),
            actions: [
              TextButton(
                child: Text("다시 시도"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
