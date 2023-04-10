
import 'package:flutter/material.dart';
import 'package:new_cola/widget/item_title_row.dart';
import 'package:new_cola/widget/more_button.dart';
import 'package:new_cola/widget/section/section.dart';
import 'package:new_cola/widget/recommend_listview.dart';

class RecommendSection extends StatefulWidget {
  const RecommendSection({Key? key}) : super(key: key);

  @override
  State<RecommendSection> createState() => _RecommendSectionState();
}

class _RecommendSectionState extends State<RecommendSection> {
  @override
  Widget build(BuildContext context) {
    return Section(child: Column(
      children:  [
        ItemTitle(
          firstText: '동물',
          isFirstBold: true,
          secondText: '을 좋아하는 당신을 위한 추천',
        ),
        SizedBox(
          height: 160,
            child: RecommendListView()),
        MoreButton(
          text: '내 관심태그 전체 보기',type: 'tags',
          onTap: (){

          },
        ),
      ],
    ));
  }
}
