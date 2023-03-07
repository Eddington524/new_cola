import 'package:flutter/material.dart';
import 'package:new_cola/repository/play_repo.dart';

import 'item_image.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PlayRepo().loadData(),
      builder: (context, snapshot) {
        var list = snapshot.data ?? [];

        return ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              var item = list[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ItemImage(
                        width: 90,
                        height: 150,
                        imgUrl: item.mediaThumbnail ?? "",
                        isCicle: false),
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.orangeAccent,
                          ],
                        ),
                      ),
                      child: ItemImage(
                          width: 30, imgUrl: item.userImg ?? '', isCicle: true),
                    ),
                  ],
                ),
              );
            },
          );
      }
    );
  }
}
