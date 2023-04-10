import 'package:flutter/material.dart';
import 'package:new_cola/pages/detail/recommend_tag_detail.dart';
import 'package:new_cola/repository/recommend_repo.dart';
import 'package:new_cola/theme/custom_color.dart';

import 'item_image.dart';

class RecommendListView extends StatefulWidget {
  const RecommendListView({Key? key}) : super(key: key);

  @override
  State<RecommendListView> createState() => _RecommendListViewState();
}

class _RecommendListViewState extends State<RecommendListView> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RecommendRepo().loadData(),
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
            var count = item.collectionCount;
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecommendDetailPage(recommendTag: item,) ));
                  },
                  child: ItemImage(
                    width: 110,
                    height: 110,
                    imgUrl: item.tagImgUrl,
                    isCicle: false,
                  ),
                ),
                const SizedBox(height: 5),
                Text(item.tagName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                const SizedBox(height: 5,),
                Text('$count개의 게시글', style: TextStyle(color: CustomColors().darkGrey)),
              ],
            );
          },
        );
    });
  }
}
