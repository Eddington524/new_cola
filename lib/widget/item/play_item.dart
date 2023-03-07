import 'package:flutter/material.dart';
import 'package:new_cola/widget/item_image.dart';

class PlayItem extends StatefulWidget {
  const PlayItem({Key? key}) : super(key: key);
  @override
  State<PlayItem> createState() => _PlayItemState();
}

class _PlayItemState extends State<PlayItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const ItemImage(
              width: 90,
              height: 150,
              imgUrl:
              'https://w0.peakpx.com/wallpaper/954/59/HD-wallpaper-slam-dunk-10-anime-bastquetball-slam-dunk.jpg',
              isCicle: false),
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.lightBlueAccent,
                  Colors.orangeAccent,
                ],
              ),
            ),
            child: const ItemImage(
                width: 30,
                imgUrl:
                'https://avatars.githubusercontent.com/u/56524770?v=4',
                isCicle: true),
          ),
        ],
      ),
    );
  }
}
