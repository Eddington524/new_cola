import 'package:flutter/material.dart';
import 'package:new_cola/repository/tag_repo.dart';
import 'package:new_cola/theme/custom_color.dart';

import 'item_image.dart';

class TagListView extends StatefulWidget {
  const TagListView({Key? key}) : super(key: key);

  @override
  State<TagListView> createState() => _TagListViewState();
}

class _TagListViewState extends State<TagListView> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TagRepo().loadData(),
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
                ItemImage(
                  width: 110,
                  height: 110,
                  imgUrl: item.tagImgUrl,
                  isCicle: false,
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
