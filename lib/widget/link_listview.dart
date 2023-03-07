
import 'package:flutter/material.dart';
import 'package:new_cola/pages/detail/item_detail.dart';
import 'package:new_cola/repository/rank_repo.dart';
import 'package:new_cola/widget/item_image.dart';

class LinkListView extends StatefulWidget {
  const LinkListView({Key? key}) : super(key: key);

  @override
  State<LinkListView> createState() => _LinkListViewState();
}

class _LinkListViewState extends State<LinkListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RankRepo().loadData(),
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
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ItemDetailPage(
                        item: item,
                      )));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemImage(
                      isCicle: false,
                      width: 100,
                      height: 100,
                      imgUrl: item.itemThumnail,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.itemTitle,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              ItemImage(
                                  width: 30,
                                  height: 30,
                                  imgUrl: item.userImg,
                                  isCicle: true),
                              SizedBox(width: 7),
                              Text(item.userName)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
