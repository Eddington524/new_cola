
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_cola/pages/detail/item_detail.dart';
import 'package:new_cola/repository/trend_repo.dart';
import 'package:new_cola/widget/item/trend_item.dart';

class TrendGridView extends StatelessWidget {
  final bool isTabView;
  const TrendGridView({Key? key, required this.isTabView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TrendRepo().loadData(),
        builder: (context, snapshot) {
          var list = snapshot.data ?? [];
          return MasonryGridView.count(
              physics: isTabView ? ScrollPhysics() : NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: list.length,
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 8,
              itemBuilder: (context, index) {
                var item = list[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemDetailPage(
                          item: item,
                        )));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: TrendItem(
                      itemImgUrl:
                      item.itemThumnail,
                      itemName: item.itemTitle,
                      userImgUrl:
                      item.userImg,
                      userName: item.userName,
                      likeCount: item.likeCount,
                      commentCount: item.commentCount,
                    ),
                  ),
                );
              },
          );
        });
  }
}
