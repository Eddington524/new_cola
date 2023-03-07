import 'package:flutter/material.dart';
import 'package:new_cola/widget/item_image.dart';

class AuctionItem extends StatelessWidget {
  const AuctionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ItemImage(
          isCicle: false,
          width: 280,
          height: 150,
          imgUrl:
              'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.theqoo.net%2Fimg%2FHbqyL.jpg&type=sc960_832',
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '쿠로미 볼 빵빵 인형',
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
                    Text('입찰가'),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 25,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        '18',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),
                  ],
                ),
                const Text(
                  '13,000원',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
