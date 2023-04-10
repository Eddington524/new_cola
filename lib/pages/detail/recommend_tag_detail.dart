import 'package:flutter/material.dart';
import 'package:new_cola/model/recommend.dart';
import 'package:new_cola/theme/custom_color.dart';
import 'package:new_cola/widget/item_image.dart';
import 'package:new_cola/widget/link_listview.dart';
import 'package:new_cola/widget/trend_staggered_view.dart';

class RecommendDetailPage extends StatefulWidget {
  const RecommendDetailPage({Key? key, required this.recommendTag})
      : super(key: key);

  final Recommend recommendTag;

  @override
  State<RecommendDetailPage> createState() => _RecommendDetailPageState();
}

class _RecommendDetailPageState extends State<RecommendDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('태그'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ItemImage(
                      width: MediaQuery.of(context).size.width -40,
                      height: MediaQuery.of(context).size.width -40,
                      imgUrl: widget.recommendTag.tagImgUrl,
                      isCicle: false),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                    child: Text(
                      widget.recommendTag.tagName,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                    ),
                  ),
                  Text(
                    '${widget.recommendTag.collectionCount}개의 게시글',
                    style: TextStyle(fontSize: 13),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                    child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors().mainBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ), child: Text('+ 관심')),
                  ),
                  Text(
                    '${widget.recommendTag.likeCount}명이 좋아해요',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end
                ,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10.0),
                    child: Text('아이템', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) =>  TrendGridView(isTabView: true)),
                            (route) => false);
                  }, child: Text('더보기', style: TextStyle(color: CustomColors().darkGrey),))
                ],
              ),
            ),
            Container(
                height: 200,
                padding: EdgeInsets.only(left: 20), child: LinkListView())
          ],
        ),
      ),
    );
  }
}
