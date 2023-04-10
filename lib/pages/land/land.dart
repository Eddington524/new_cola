import 'package:flutter/material.dart';
import 'package:new_cola/widget/land_market_listview.dart';

class LandPage extends StatefulWidget {
  const LandPage({Key? key}) : super(key: key);

  @override
  State<LandPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<LandPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마켓'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: Text('중고거래', style: TextStyle(fontSize: 20),)),
          Expanded(
              child: LandMarketListView())
        ],
      )
    );
  }
}