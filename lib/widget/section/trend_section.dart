
import 'package:flutter/material.dart';
import 'package:new_cola/widget/more_button.dart';
import 'package:new_cola/widget/section/section.dart';
import 'package:new_cola/widget/trend_staggered_view.dart';

class TrendSection extends StatefulWidget {
  const TrendSection({Key? key}) : super(key: key);

  @override
  State<TrendSection> createState() => _TrendSectionState();
}

class _TrendSectionState extends State<TrendSection> {
  List<double> widgetHeights = [];
  List<double> widgetColors = [];

  @override
  Widget build(BuildContext context) {
    return Section(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "sam1",
                    style: TextStyle(color: Colors.orange, fontSize: 25),
                  ),
                  Text("님을 위한", style: TextStyle(fontSize: 25))
                ],
              ),
              const Text(
                '트렌드 아이템',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TrendGridView(isTabView: false,),
            ],
          ),
        ),
        /// 더보기 버튼
        const MoreButton(
          text: '트렌드 더보기',
        )
      ],
    ));
  }
}
