import 'package:flutter/material.dart';
import 'package:new_cola/provider/home_tab_provider.dart';
import 'package:new_cola/widget/more_button.dart';
import 'package:new_cola/widget/section/section.dart';
import 'package:new_cola/widget/trend_staggered_view.dart';
import 'package:provider/provider.dart';

class TrendSection extends StatefulWidget {
  Function? onMoreTap;

  TrendSection({Key? key}) : super(key: key);

  @override
  State<TrendSection> createState() => _TrendSectionState();
}

class _TrendSectionState extends State<TrendSection> {
  List<double> widgetHeights = [];
  List<double> widgetColors = [];

  late HomeTabProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<HomeTabProvider>(context, listen: false);
  }

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
            Consumer<HomeTabProvider>(builder: (context, provider, _) {
              return MoreButton(text: '트렌드 더보기', type: 'trend', onTap: () {
                _provider.setIndex(1);
                // widget.onMoreTap?.call();
              });
            },),
          ],
        ));
  }
}
