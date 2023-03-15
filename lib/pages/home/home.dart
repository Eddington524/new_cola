
import 'package:flutter/material.dart';
import 'package:new_cola/pages/home/tab/item.dart';
import 'package:new_cola/pages/home/tab/town.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _nestedTabController;

  @override
  void initState() {
    super.initState();
    _nestedTabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          width: 350,
          height: 50,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: const [
              Icon(Icons.search, size: 30),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "검색어를 입력해주세요", border: InputBorder.none),
                ),
              )),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TabBar(
            controller: _nestedTabController,
            indicatorColor: Colors.orange,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const <Widget>[
              Tab(
                text: 'TOWN',
              ),
              Tab(
                text: 'ITEM',
              ),
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: _nestedTabController,
            children: [TownScreen(), ItemScreen()],
          ))
        ],
      ),
    );
  }
}
