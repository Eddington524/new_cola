import 'package:flutter/material.dart';
import 'package:new_cola/widget/item_title_row.dart';
import 'package:new_cola/widget/news_listview.dart';
import 'package:new_cola/widget/section/section.dart';

class NewsSection extends StatefulWidget {
  const NewsSection({Key? key}) : super(key: key);

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  @override
  Widget build(BuildContext context) {
    return Section(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ItemTitle(
          firstText: '콜리포터가 전하는 소식',
          isFirstBold: false,
        ),
        SizedBox(
          height: 160,
          child: NewsListView(),
        )
      ],
    ));
  }
}
