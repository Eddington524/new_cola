import 'package:flutter/material.dart';
import 'package:new_cola/widget/item_image.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('알림'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('활동', style: TextStyle(fontSize: 20),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                ItemImage(width: 70, height: 70,imgUrl: 'https://avatars.githubusercontent.com/u/56524770?v=4', isCicle: true),
                SizedBox(width: 7,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('오늘의 일일 미션을 달성했습니다', style: TextStyle(fontWeight: FontWeight.w500),),
                    Text('9일전'),
                  ],
                )
              ],
            ),
          )
        ],
      ) ,
    );
  }
}