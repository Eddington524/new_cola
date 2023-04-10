import 'package:flutter/material.dart';
import 'package:new_cola/widget/market_gridview_page.dart';
import 'package:new_cola/widget/more_button.dart';
import 'package:new_cola/widget/section/section.dart';


class MarketSection extends StatefulWidget {
  const MarketSection({Key? key}) : super(key: key);

  @override
  State<MarketSection> createState() => _MarketSectionState();
}

class _MarketSectionState extends State<MarketSection> {
  @override
  Widget build(BuildContext context) {
    return Section(child: Column(
      children: [
        /// text 묶음
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text("레어한 상품을 찾는다면",
                      style: TextStyle(fontSize: 25))
                ],
              ),
              const Text('덕친마켓에서',
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600))
            ],
          ),
        ),
        SizedBox(height:470, child: GridviewPage()),
        const SizedBox(
          height: 10,
        ),
        MoreButton(
          text: '마켓 더보기',
          type: 'market', onTap: (){

        },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ));
  }
}
