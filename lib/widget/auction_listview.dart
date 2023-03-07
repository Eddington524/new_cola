
import 'package:flutter/material.dart';
import 'package:new_cola/repository/auction_repo.dart';
import 'package:new_cola/theme/custom_color.dart';
import 'package:new_cola/widget/Box.dart';
import 'package:new_cola/widget/item_image.dart';

class AuctionListView extends StatefulWidget {
  const AuctionListView({Key? key}) : super(key: key);

  @override
  State<AuctionListView> createState() => _AuctionListViewState();
}

class _AuctionListViewState extends State<AuctionListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuctionRepo().loadData(),
        builder: (context, snapshot) {
          var list = snapshot.data ?? [];
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              var item = list[index];
              var count = item.count;
              var price = item.price;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemImage(
                    isCicle: false,
                    width: 300,
                    height: 150,
                    imgUrl: item.itemThumnail,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    item.itemTitle,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('입찰가'),
                              const SizedBox(
                                width: 5,
                              ),
                              Box(
                                text: '$count',
                                w: 25,
                                h: 20,
                                bgColor: Colors.grey.withOpacity(0.2),
                                textColor: CustomColors().darkGrey,
                              )
                            ],
                          ),
                          Text(
                            '$price원',
                            style: TextStyle(
                                color: CustomColors().mainBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        });
  }
}
