import 'package:flutter/material.dart';
import 'package:new_cola/repository/my_tag_repo.dart';
import 'package:new_cola/theme/custom_color.dart';
import 'package:new_cola/widget/Box.dart';

class MytagBoxListView extends StatefulWidget {
  const MytagBoxListView({Key? key}) : super(key: key);

  @override
  State<MytagBoxListView> createState() => _MytagBoxListViewState();
}

class _MytagBoxListViewState extends State<MytagBoxListView> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MyTagsRepo().loadData(),
        builder: (context, snapshot) {
          var list = snapshot.data ?? [];
          return  ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              var item = list[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: CustomColors().mainBlue,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    '${item.title}',
                    // textAlign: TextAlign.center,
                    style: TextStyle(color: CustomColors().mainBlue),
                  ),
                ),
              );
            },
          );
        });
  }
}
