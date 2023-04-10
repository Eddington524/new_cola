import 'package:flutter/material.dart';
import 'package:new_cola/model/market.dart';
import 'package:new_cola/widget/item_image.dart';
import 'package:new_cola/widget/link_listview.dart';

class MarketDetailPage extends StatelessWidget {
  final Market market;
  const MarketDetailPage({Key? key, required this.market}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                market.itemThumnail,
                fit: BoxFit.contain,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ItemImage(
                            width: 50,
                            imgUrl: market.itemThumnail,
                            isCicle: true),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              market.userName,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),

                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Text(
                '${market.itemTitle}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '직거래',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Small_button(
                    //     w: 85,
                    //     h: 30,
                    //     bgColor: CustomColors().mainBlue,
                    //     text: '${market.}',
                    //     textColor: Colors.white),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    '연관된 아이템',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 20), child: LinkListView())
            ],
          ),
        ));
  }
}
