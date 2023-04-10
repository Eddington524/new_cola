import 'package:flutter/material.dart';
import 'package:new_cola/repository/market_repo.dart';
import 'package:new_cola/widget/item_image.dart';

class LandMarketListView extends StatefulWidget {
  const LandMarketListView({Key? key}) : super(key: key);

  @override
  State<LandMarketListView> createState() => _LandMarketListViewState();
}

class _LandMarketListViewState extends State<LandMarketListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MarketRepo().loadData(),
        builder: (context, snapshot) {
          var list = snapshot.data ?? [];
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
            itemCount: list.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, int index) {
              var item = list[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    ItemImage(
                        width: 70,
                        height: 70,
                        imgUrl: '${item.itemThumnail}',
                        isCicle: false),
                    SizedBox(
                      width: 7,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width-120,
                      height: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              '${item.itemTitle}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Text('${item.price}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
