import 'package:flutter/material.dart';
import 'package:new_cola/pages/Auth/login.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Login(),
      // child: Column(
      //   children: [
      //     Container(
      //       color: Colors.black12,
      //     )
      //   ],
      // ),
      // color: Colors.pinkAccent,
    );
  }
}
