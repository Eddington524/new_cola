
import 'package:flutter/material.dart';
import 'package:new_cola/widget/section/auction_section.dart';
import 'package:new_cola/widget/section/banner_section.dart';
import 'package:new_cola/widget/section/market_section.dart';
import 'package:new_cola/widget/section/news_section.dart';
import 'package:new_cola/widget/section/playlist_section.dart';
import 'package:new_cola/widget/section/promotion_section.dart';
import 'package:new_cola/widget/section/rank_section.dart';
import 'package:new_cola/widget/section/recommend_section.dart';
import 'package:new_cola/widget/section/trend_section.dart';

class TownScreen extends StatefulWidget {
  const TownScreen({Key? key}) : super(key: key);

  @override
  State<TownScreen> createState() => _TownScreenState();
}

class _TownScreenState extends State<TownScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colors.black12,
          alignment: Alignment.center,
          child: Column(
            children: [
              ///베너
              BannerSliderView(),

              TrendSection(),

              PlaylistSection(),

              RecommendSection(),

              MarketSection(),

              NewsSection(),

              AuctionSection(),

              RankSection(),

              PromotionSection(),
            ],
          )),
    );
  }
}
