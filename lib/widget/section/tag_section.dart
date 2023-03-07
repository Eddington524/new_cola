
import 'package:flutter/material.dart';
import 'package:new_cola/widget/item_title_row.dart';
import 'package:new_cola/widget/more_button.dart';
import 'package:new_cola/widget/section/section.dart';
import 'package:new_cola/widget/tag_listview.dart';

class TagSection extends StatefulWidget {
  const TagSection({Key? key}) : super(key: key);

  @override
  State<TagSection> createState() => _TagSectionState();
}

class _TagSectionState extends State<TagSection> {
  @override
  Widget build(BuildContext context) {
    return Section(child: Column(
      children: const [
        ItemTitle(
          firstText: '동물',
          isFirstBold: true,
          secondText: '을 좋아하는 당신을 위한 추천',
        ),
        SizedBox(
          height: 160,
            child: TagListView()),
        MoreButton(
          text: '내 관심태그 전체 보기',
        ),
      ],
    ));
  }
}
