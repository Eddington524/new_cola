
import 'package:flutter/material.dart';
import 'package:new_cola/repository/news_repo.dart';
import 'package:new_cola/theme/custom_color.dart';
import 'package:new_cola/widget/item_image.dart';
import 'package:new_cola/widget/small_button.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NewsRepo().loadDate(),
        builder: (context,snapshot) {
          var list = snapshot.data ?? [];

          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              if(index == 0){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ItemImage(
                      width: 90,
                      height: 90,
                      imgUrl:
                      'https://avatars.githubusercontent.com/u/56524770?v=4',
                      isCicle: true,
                    ),

                    /// 중간에 expend 넣는 방법!
                    const Expanded(
                        child: Center(
                            child: Text(
                              '콜리포터🪐',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ))),
                    Small_button(
                        w: 75,
                        h: 30,
                        bgColor: CustomColors().mainBlue,
                        textColor: Colors.white,
                        text: '팔로우'),
                  ],
                );
              } else {
                return Row(
                  children: [
                    ItemImage(
                        width: 160,
                        height: 160,
                        imgUrl: list[index].itemThumnail,
                        isCicle: false),
                  ],
                );
              }
            },
          );
    });

  }
}
