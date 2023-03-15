import 'package:flutter/material.dart';
import 'package:new_cola/pages/detail/item_detail.dart';
import 'package:new_cola/repository/rank_repo.dart';
import 'package:new_cola/widget/item_image.dart';

class RankListView extends StatefulWidget {
  const RankListView({Key? key}) : super(key: key);

  @override
  State<RankListView> createState() => _RankListViewState();
}

class _RankListViewState extends State<RankListView> {

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
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 30),
                          child: ItemImage(
                            isCicle: false,
                            width: 230,
                            height: 230,
                            imgUrl: item.itemThumnail,
                          ),
                        ),
                        Transform.rotate(
                          angle: -0.15,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(Icons.star,
                                  shadows: <Shadow>[
                                    Shadow(
                                      color: Colors.black54,
                                      blurRadius: 15.0,
                                      offset: Offset.fromDirection(1),
                                    ),
                                  ],
                                  size: 55,
                                  color: Colors.white),
                              const Icon(Icons.star,
                                  size: 47, color: Colors.greenAccent),
                              Text('${index + 1}'),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
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
                          Container(
                            width: 220,
                            height: 3,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          Text('좋아요 ${item.likeCount}개'),
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
