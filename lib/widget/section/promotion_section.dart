import 'package:flutter/material.dart';
import 'package:new_cola/theme/custom_color.dart';
import 'package:new_cola/widget/Box.dart';
import 'package:new_cola/widget/item_image.dart';
import 'package:new_cola/widget/item_title_row.dart';
import 'package:new_cola/widget/more_button.dart';
import 'package:new_cola/widget/section/section.dart';
import 'package:new_cola/widget/timer.dart';


class PromotionSection extends StatefulWidget {
  const PromotionSection({Key? key}) : super(key: key);

  @override
  State<PromotionSection> createState() => _PromotionSectionState();
}

class _PromotionSectionState extends State<PromotionSection> {
  @override
  Widget build(BuildContext context) {
    return Section(
        child: Column(
      children: [
        ItemTitle(
          firstText: '콜리샵 ',
          isFirstBold: true,
          secondText: '기획전',
        ),
        GestureDetector(
          onTap: (){
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const ItemImage(
                    imgUrl:
                        'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.theqoo.net%2Fimg%2FHbqyL.jpg&type=sc960_832',
                    isCicle: false,
                  ),

                  /// 타이머 영역
                  Positioned(bottom: 15,
                      child: Timer()),
                ],
              ),
              Container(
                height: 101,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('콜리'),
                    const Text(
                      '에스더버니 무드등 가습기',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    // 가격행
                    Row(
                      children: const [
                        Text('44%',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.w600)),
                        Text("14,700원",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        Text("21,000원",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black26,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    Row(
                      children: [
                        Box(
                            w: 20,
                            h: 20,
                            bgColor: CustomColors().boxRed,
                            text: 'N',
                            textColor: Colors.white,
                            borderRadius: 4.0),
                        Box(
                            w: 70,
                            h: 20,
                            bgColor: CustomColors().mainBlue,
                            text: 'only 콜리',
                            textColor: Colors.white,
                            borderRadius: 4.0),
                        Box(
                            w: 65,
                            h: 20,
                            bgColor: CustomColors().boxGrey,
                            text: '사전예약',
                            textColor: CustomColors().darkGrey)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        MoreButton(text: "경매상품 더보기")
      ],
    ));
  }
}
