
import 'package:flutter/material.dart';
import 'package:new_cola/repository/play_repo.dart';
import 'package:new_cola/widget/item_title_row.dart';
import 'package:new_cola/widget/play_listview_page.dart';
import 'package:new_cola/widget/section/section.dart';


class PlaylistSection extends StatefulWidget {
  const PlaylistSection({Key? key}) : super(key: key);

  @override
  State<PlaylistSection> createState() => _PlaylistSectionState();
}

class _PlaylistSectionState extends State<PlaylistSection> {

  @override
  void initState() {
    super.initState();
    PlayRepo().loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Section(child: Column(
      children: const [
        ItemTitle(
          firstText: '오늘의 ',
          isFirstBold: false,
          secondText: '인기 플레이',
        ),
        SizedBox(
            height: 150,
            child: ListViewPage(),),
      ],
    ),
    );
  }
}
